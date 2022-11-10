import 'package:flutter/material.dart';

import '../../data_model/recipes.dart';
import 'recipes_list_card.dart';

class RecipesListView extends StatelessWidget {
  final List<RecipeData> recipes;
  const RecipesListView({Key? key, required this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap:  true,
      padding:     EdgeInsets.zero,
      itemBuilder: (_, index) => RecipesCards(recipe: recipes[index]),
      itemCount:   recipes.length,
      
    );
  }
}
