import 'package:flutter/material.dart';
import 'package:memory_game/logic/game_notifier.dart';
import '../../../data/models/game_model.dart';


PreferredSizeWidget buildAppBar(BuildContext context, GameNotifier gameNotifier, GameState gameState) {
  return AppBar(
    title: const Text('Juego de Memoria'),
    actions: [
      IconButton(
        icon: const Icon(Icons.refresh),
        onPressed: () => gameNotifier.resetGame(gameState.selectedCategory),
      ),
    ],
  );
}
