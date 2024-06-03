import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_game/data/emojic_data.dart';
import '../data/models/game_model.dart';

class GameNotifier extends StateNotifier<GameState> {
  Timer? _gameTimer;

  GameNotifier() : super(GameState()) {
    _initializeGame();
    _startTimer();
  }

  void _initializeGame([String category = '👻']) {
    state = state.copyWith(
      emojis: emojiCategories[category]!..shuffle(Random()),
      revealed: List<bool>.filled(24, false),
      errors: 0,
      turns: 0,
      timeElapsed: 0,
      selectedIndices: [],
      selectedCategory: category,
    );
  }

  void _startTimer() {
    _gameTimer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      state = state.copyWith(timeElapsed: state.timeElapsed + 1);
    });
  }

  void onTileTapped(int index, BuildContext context, GameState gameState) {
    if (state.revealed[index] || state.selectedIndices.length == 2) return;

    final newRevealed = List<bool>.from(state.revealed);
    newRevealed[index] = true;
    final newSelectedIndices = List<int>.from(state.selectedIndices)
      ..add(index);

    state = state.copyWith(
        revealed: newRevealed, selectedIndices: newSelectedIndices);

    if (newSelectedIndices.length == 2) {
      state = state.copyWith(turns: state.turns + 1);
      if (state.emojis[newSelectedIndices[0]] !=
          state.emojis[newSelectedIndices[1]]) {
        state = state.copyWith(errors: state.errors + 1);
        Future.delayed(const Duration(milliseconds: 500), () {
          final resetRevealed = List<bool>.from(state.revealed);
          resetRevealed[newSelectedIndices[0]] = false;
          resetRevealed[newSelectedIndices[1]] = false;
          state = state.copyWith(revealed: resetRevealed, selectedIndices: []);
        });
      } else {
        state = state.copyWith(selectedIndices: []);
        if (newRevealed.every((element) => element)) {
          _stopTimer();
         showAboutDialog(context: context);
          _showWinDialog(context);
        }
      }
    }
  }

  //refactor new widget
  void _showWinDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¡HAS GANADO!'),
          content: const Text('Has encontrado todos los pares.'),
          actions: [
            TextButton(
              child: const Text('Jugar de nuevo'),
              onPressed: () {
                Navigator.of(context).pop();
                resetGame();
              },
            ),
          ],
        );
      },
    );
  }


  void _stopTimer() {
    _gameTimer?.cancel();
  }

  void resetGame([String category = '👻']) {
    _initializeGame(category);
    _stopTimer();
    _startTimer();
  }

  void setCategory(String category) {
    resetGame(category);
  }
}
