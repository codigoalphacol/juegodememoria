import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_game/presentations/ui/widgets/app_bar_widget.dart';
import 'package:memory_game/presentations/ui/widgets/categori_selector_widget.dart';
import 'package:memory_game/presentations/ui/widgets/stats_widgets.dart';
import '../../providers/game_provider.dart';
import 'widgets/grid_game_widget.dart';


class UiGame extends ConsumerWidget {
  const UiGame({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameProvider);
    final gameNotifier = ref.read(gameProvider.notifier);

    return Scaffold(
      appBar: buildAppBar(context, gameNotifier, gameState),
      body: Column(
        children: [          
          StatsWidget(gameState: gameState),
          const SizedBox(height: 16.0),
          CategorySelectorContainer(gameNotifier: gameNotifier, gameState: gameState),          
          const SizedBox(height: 16.0),
          const GameGrid(),
        ],
      ),
    );
  }
}
