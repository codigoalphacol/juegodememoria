class GameState {
  final List<String> emojis;
  final List<bool> revealed;
  final int errors;
  final int turns;
  final int timeElapsed;
  final List<int> selectedIndices;
  final String selectedCategory;

  GameState({
    this.emojis = const [],
    this.revealed = const [],
    this.errors = 0,
    this.turns = 0,
    this.timeElapsed = 0,
    this.selectedIndices = const [],
    this.selectedCategory = '👻', 
  });

  GameState copyWith({
    List<String>? emojis,
    List<bool>? revealed,
    int? errors,
    int? turns,
    int? timeElapsed,
    List<int>? selectedIndices,
    String? selectedCategory,
  }) {
    return GameState(
      emojis: emojis ?? this.emojis,
      revealed: revealed ?? this.revealed,
      errors: errors ?? this.errors,
      turns: turns ?? this.turns,
      timeElapsed: timeElapsed ?? this.timeElapsed,
      selectedIndices: selectedIndices ?? this.selectedIndices,
       selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}
