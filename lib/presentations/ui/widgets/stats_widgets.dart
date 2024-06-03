import 'package:flutter/material.dart';
import '../../../data/models/game_model.dart';


class StatsWidget extends StatelessWidget {
  final GameState gameState;

  const StatsWidget({super.key, required this.gameState});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Errores: ${gameState.errors}'),
          Text('Turnos: ${gameState.turns}'),
          Text(
            'Tiempo: ${gameState.timeElapsed ~/ 60}:${(gameState.timeElapsed % 60).toString().padLeft(2, '0')}',
          ),
        ],
      ),
    );
  }
}
