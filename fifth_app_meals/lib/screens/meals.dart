import 'package:fifth_app_meals/models/meal.dart';
import 'package:fifth_app_meals/screens/meal_details.dart';
import 'package:fifth_app_meals/widgets/meal_list_item.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals,});
  final String? title;

  void onSelectMeal(BuildContext context, Meal meal) {
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => MealDetails(meal: meal,)));
  }

  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    Widget content = meals.isEmpty
        ? Center(
            child: Text(
            'Uh..oh, no meals here.\nTry selecting a different category!',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontSize: 20,
            ),
          ))
        : ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return MealListItem(
                meal: meals[index],
                onSelectMeal: () {
                  onSelectMeal(context, meals[index]);
                },
              );
            },
          );
    if (title == null) {
      return content;
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            title!,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: content,
      );
    }
  }
}
