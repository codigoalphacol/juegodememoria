import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_game/logic/game_notifier.dart';
import '../data/models/game_model.dart';

final gameProvider = StateNotifierProvider<GameNotifier, GameState>((ref) {
  return GameNotifier();
});

