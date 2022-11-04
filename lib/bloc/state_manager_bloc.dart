import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';

import '../cloud_functions/web_service.dart';
import '../data_model/recipes.dart';
import '../data_model/recipe_details.dart';

part 'state_manager_event.dart';
part 'state_manager_state.dart';

@injectable
class StateManagerBloc extends Bloc<StateManagerEvent, StateManagerState> {

  final WebService  webService;
  late  JSONRecipes recipesList;

  StateManagerBloc( this. webService ) : super( const SMSInitial() ) {

    on<SMEInit>( (event, emit) async {
      recipesList = await webService.getreceptList();
      emit( SMSInit(recipesList) );
    });

    on<SMERecipeSelect>( (event, emit) async {
      JSONRecipeDetails selectedRecipe = await webService.getReceptdetails( event.id );
      emit( SMSRecipeSelect( selectedRecipe ) );
    });

    on<SMESearch>( (event, emit){
      List<RecipeData>? foundedRecipes = 
      recipesList.recipes.where( 
        (element) => 
          element.name.toLowerCase().contains( event.searchItem.toLowerCase() ) )
          .toList();

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
