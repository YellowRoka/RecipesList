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

  bool isErrorActive = false;

  StateManagerBloc( this. webService ) : super( const SMSInitial() ) {

    on<SMEInit>( (event, emit) async {
      try{
        recipesList = await webService.getreceptList();
        isErrorActive = false;
        emit( SMSInit(recipesList) ); 
      }
      catch(e){
        isErrorActive = true;
        emit( const SMSNetError() );
      }
      
    });

    on<SMERecipeSelect>( (event, emit) async {
      try{
        JSONRecipeDetails selectedRecipe = await webService.getReceptdetails( event.id );
        isErrorActive = false;
        emit( SMSRecipeSelect( selectedRecipe ) );
      }
      catch(e){
        isErrorActive = true;
        emit( const SMSNetError() );
      }
    });

    on<SMESearch>( (event, emit){
      try{
        List<RecipeData>? foundedRecipes = 
        recipesList.recipes.where( 
          (element) => 
            element.name.toLowerCase().contains( event.searchItem.toLowerCase() ) )
            .toList();

        isErrorActive = false;
        emit( SMSSearch( foundedRecipes ) );
      }
      catch(e){
        isErrorActive = true;
        emit( const SMSNetError() );
      }
    });

    on<SMEBack>( (event, emit) async {
      
      try{
        emit( const SMSBack() );
        isErrorActive = false;
        emit( SMSInit(recipesList) );
      }
      catch(e){
        isErrorActive = true;
        emit( const SMSBack() );
      }

    });

    on<SMEOpenSearchBar>( (event, emit ){
      if( !isErrorActive ){
        emit( const SMSOpenSearchBar() );
      }
    });

  }
}
