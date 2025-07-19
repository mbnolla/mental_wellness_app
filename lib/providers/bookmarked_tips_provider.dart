import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookmarkedTipsNotifier extends StateNotifier<Set<int>> {
  BookmarkedTipsNotifier() : super({});

  void toggleBookmark(int index) {
    if (state.contains(index)) {
      state = {...state}..remove(index);
    } else {
      state = {...state}..add(index);
    }
  }

  bool isBookmarked(int index) {
    return state.contains(index);
  }
}

final bookmarkedTipsProvider =
StateNotifierProvider<BookmarkedTipsNotifier, Set<int>>(
      (ref) => BookmarkedTipsNotifier(),
);
