import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_game/providers/category_state.dart';

class CategorySelector extends ConsumerWidget {
  final List<String> categories;
  final ValueChanged<String> onCategorySelected;

  const CategorySelector({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        final isSelected = category == selectedCategory;
        return GestureDetector(
          onTap: () {
            ref.read(selectedCategoryProvider.notifier).state = category;
            onCategorySelected(category);
          },
          child: Container(            
            width: 90,
            margin: const EdgeInsets.symmetric(horizontal: 6.0),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.grey[400],
              borderRadius: BorderRadius.circular(50.0),
              boxShadow: [
                if (isSelected)
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
              ],
            ),
            child: Center(
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
        
      },
    );
  }
}

