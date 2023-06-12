import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  void toggleMealFavoriteStatus(Meal meal) {
    // In Order to work you need all ways create new object on the memory of the device
    // and set this new created object to the state.
    // Riverpod force to use this approach.

    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      // remove
      state = state.where((element) => element.id != meal.id).toList();
    } else {
      // add
      state = [...state, meal];
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
