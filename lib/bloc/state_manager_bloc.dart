import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../cloud_functions/web_handler.dart';
import '../model/recipe_details.dart';
import '../model/recipes.dart';

part 'state_manager_event.dart';
part 'state_manager_state.dart';

class StateManagerBloc extends Bloc<StateManagerEvent, StateManagerState> {

  late WebServiceInterface webService;
  late JSONRecipes         recipesList;


  StateManagerBloc() : super( const SMSInitial() ) {

    on<SMEInit>( (event, emit) async {
      webService  = WebServiceHandler();
      recipesList = await webService.getreceptList();
      emit( SMSInit(recipesList) );
    });

    on<SMERecipeSelect>( (event, emit) async {
      webService  = WebServiceHandler();
      JSONRecipeDetails selectedRecipe = await webService.getReceptdetails( event.id );

      emit( SMSRecipeSelect( selectedRecipe ) );
    });

    on<SMESearch>( (event, emit){
      List<RecipeData>? foundedRecipes = recipesList.recipes.where( (element) => element.name.contains(event.searchItem) ).toList();
      emit( SMSSearch( foundedRecipes ) );
    });

    on<SMEBack>( (event, emit) async {
      emit( const SMSBack() );
      recipesList = await webService.getreceptList();
      emit( SMSInit(recipesList) );
    });

    on<SMEOpenSearchBar>( (event, emit ){
      emit( const SMSOpenSearchBar() );
    });

  }
}
