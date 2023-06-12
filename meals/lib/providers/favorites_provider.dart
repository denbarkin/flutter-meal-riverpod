import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    // In Order to work you need all ways create new object on the memory of the device
    // and set this new created object to the state.
    // Riverpod force to use this approach.

    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      // remove
      state = state.where((element) => element.id != meal.id).toList();
      return false; // Return False if item removed from the list in order to show the right msg.
    } else {
      // add
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
