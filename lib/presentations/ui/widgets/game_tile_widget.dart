import 'package:flutter/material.dart';
import 'package:memory_game/logic/game_notifier.dart';
import '../../../data/models/game_model.dart';


class GameTile extends StatelessWidget {
  final int index;
  final GameNotifier gameNotifier;
  final GameState gameState;

  const GameTile({
    super.key,
    required this.index,
    required this.gameNotifier,
    required this.gameState,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => gameNotifier.onTileTapped(index, context, gameState),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            gameState.revealed[index] ? gameState.emojis[index] : '',
            style: const TextStyle(
              fontSize: 50,
              fontFamily: 'Noto Color Emoji', 
              fontFamilyFallback: [
                'Apple Color Emoji', 
                'Arial', 
              ],
            ),
          ),
        ),
      ),
    );
  }
}