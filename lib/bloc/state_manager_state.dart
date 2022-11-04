part of 'state_manager_bloc.dart';

@immutable
abstract class StateManagerState {
  const StateManagerState();

  List<Object> get props => [];
}

class SMSInitial extends StateManagerState{
  const SMSInitial();
}

class SMSInit extends StateManagerState{
  final JSONRecipes recipes;

  const SMSInit(this.recipes);

  @override
  List<Object> get props => [ recipes ];
}

class SMSBack extends StateManagerState{
  const SMSBack();
}

class SMSRecipeSelect extends StateManagerState{
  final RecipeDetailsData selectedRecipe;

  const SMSRecipeSelect(this.selectedRecipe);

  @override
  List<Object> get props => [selectedRecipe];
}

class SMSSearch extends StateManagerState{
  final List<RecipeData>? foundedRecipes;

  const SMSSearch(this.foundedRecipes);

  @override
  List<Object> get props => [ foundedRecipes??"" ];
}

class SMSOpenSearchBar extends StateManagerState{
  const SMSOpenSearchBar();
}

class SMSNetError extends StateManagerState{
  const SMSNetError();
}
