import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../providers/game_provider.dart';
import 'game_tile_widget.dart';


class GameGrid extends ConsumerWidget {
  const GameGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameProvider);
    final gameNotifier = ref.read(gameProvider.notifier);  

    return Expanded(
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          int crossAxisCountX;
          if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
            crossAxisCountX = 4;
          } else if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
            crossAxisCountX = 6;
          } else {
            crossAxisCountX = 8;
          }        
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(          
            crossAxisCount: crossAxisCountX, 
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          padding: const EdgeInsets.all(16.0),
          itemCount: gameState.emojis.length,
          itemBuilder: (context, index) {
            return GameTile(index: index, gameNotifier: gameNotifier, gameState: gameState);
          },
        );
}),
    );
  }
}