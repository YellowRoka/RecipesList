part of 'state_manager_bloc.dart';

@immutable
abstract class StateManagerState {
  const StateManagerState();

  List<Object> get props => [];
}

class SMStateInitial extends StateManagerState{
  const SMStateInitial();
}

class SMStateInit extends StateManagerState{
  final List<RecipeData> recipes;

  const SMStateInit(this.recipes);

  @override
  List<Object> get props => [ recipes ];
}

class SMStateBack extends StateManagerState{
  const SMStateBack();
}

class SMStateRecipeSelect extends StateManagerState{
  final RecipeDetailsData selectedRecipe;

  const SMStateRecipeSelect(this.selectedRecipe);

  @override
  List<Object> get props => [selectedRecipe];
}

class SMStateSearch extends StateManagerState{
  final List<RecipeData>? foundedRecipes;

  const SMStateSearch(this.foundedRecipes);

  @override
  List<Object> get props => [ foundedRecipes??"" ];
}

class SMStateOpenSearchBar extends StateManagerState{
  const SMStateOpenSearchBar();
}

class SMSNetError extends StateManagerState{
  const SMSNetError();
}
