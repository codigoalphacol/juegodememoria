import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_game/logic/game_notifier.dart';

import '../../../data/models/game_model.dart';

class WinDialog extends ConsumerWidget {
final GameState gameState;
WinDialog(this.gameState, {super.key});
  
final gameNotifierProvider = Provider((ref) => GameNotifier());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  // final gameNotifier = ref.read(gameNotifierProvider); 
  
    return AlertDialog(
      title: const Text('¡HAS GANADO!'),
      content: const Text('Has encontrado todos los pares.'),
      actions: [
        TextButton(
          child: const Text('Jugar de nuevo'),
          onPressed: () {
            Navigator.of(context).pop();  
            GameNotifier().resetGame();             },
        ),
      ],
    );
  }
}


