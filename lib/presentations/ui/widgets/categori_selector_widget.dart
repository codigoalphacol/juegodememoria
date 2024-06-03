import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_game/data/emojic_data.dart';
import 'package:memory_game/data/models/game_model.dart';
import 'package:memory_game/logic/game_notifier.dart';
import 'category_selector.dart';

class CategorySelectorContainer extends ConsumerWidget {
  final GameNotifier gameNotifier;
  final GameState gameState;

  const CategorySelectorContainer({
    super.key,
    required this.gameNotifier,
    required this.gameState,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 90,
      width: 640,
      color: Colors.grey[200],
      child: CategorySelector(
        categories: emojiCategories.keys.toList(),
        onCategorySelected: (newCategory) {
           gameNotifier.setCategory(newCategory);
          },        
      ),
    );
  }
}



