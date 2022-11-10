import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/state_manager_bloc.dart';
import '../../data_model/recipes.dart';
import '../recipes_list_view_parts/recipes_list_card.dart';


class SearchRecipesListView extends StatefulWidget {

  const SearchRecipesListView({Key? key}) : super(key: key);

  @override
  State<SearchRecipesListView> createState() => _SearchRecipesListViewState();
}

class _SearchRecipesListViewState extends State<SearchRecipesListView> {
  @override
  Widget build(BuildContext context) {
      List<RecipeData> foundedRecipes = [];

    return BlocBuilder<StateManagerBloc, StateManagerState>(
      builder: (context,state) {
        if(state is SMStateSearch){
          if(state.foundedRecipes != null ){
            foundedRecipes = state.foundedRecipes!;
          }
        }

        return ListView.builder(
          shrinkWrap:  true,
          padding:     EdgeInsets.zero,
          itemBuilder: (_, index) => RecipesCards(recipe: foundedRecipes[index]),
          itemCount:   foundedRecipes.length,
        );
      }
    );
  }
}
