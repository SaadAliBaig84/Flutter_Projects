import 'package:fifth_app_meals/providers/favorites_provider.dart';
import 'package:fifth_app_meals/providers/filters_provider.dart';
import 'package:fifth_app_meals/screens/categories.dart';
import 'package:fifth_app_meals/screens/filters_screen.dart';
import 'package:fifth_app_meals/screens/meals.dart';
import 'package:fifth_app_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kInitialFilters = {
  Filters.glutenFree: false,
  Filters.lactoseFree: false,
  Filters.vegetarian: false,
  Filters.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return TabScreenState();
  }
}

class TabScreenState extends ConsumerState<TabsScreen> {
  var currentActiveScreenIndex = 0;

  void onTap(index) {
    setState(() {
      currentActiveScreenIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'Filters') {
      await Navigator.push<Map<Filters, bool>>(
        context,
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);
    Widget activeScreen = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var currentActiveScreen = 'Categories';
    if (currentActiveScreenIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      currentActiveScreen = 'Favorites';
      activeScreen = MealsScreen(
        meals: favoriteMeals,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentActiveScreen,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentActiveScreenIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
        onTap: onTap,
      ),
    );
  }
}
