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
  late  List<RecipeData> recipesList;

  bool isErrorActive = false;

  StateManagerBloc( this. webService ) : super( const SMStateInitial() ) {

    on<SMEventInit>( (event, emit) async {
      try{
        recipesList = await webService.getreceptList();
        isErrorActive = false;
        emit( SMStateInit(recipesList) ); 
      }
      catch(e){
        isErrorActive = true;
        emit( const SMSNetError() );
      }
      
    });

    on<SMEventRecipeSelect>( (event, emit) async {
      try{
        JSONRecipeDetails selectedRecipe = await webService.getReceptdetails( event.id );
        isErrorActive = false;
        emit( SMStateRecipeSelect( selectedRecipe ) );
      }
      catch(e){
        isErrorActive = true;
        emit( const SMSNetError() );
      }
    });

    on<SMEventSearch>( (event, emit){
      try{
        List<RecipeData>? foundedRecipes = 
        recipesList.where( 
          (element) => 
            element.name.toLowerCase().contains( event.searchItem.toLowerCase() ) )
            .toList();

        isErrorActive = false;
        emit( SMStateSearch( foundedRecipes ) );
      }
      catch(e){
        isErrorActive = true;
        emit( const SMSNetError() );
      }
    });

    on<SMEventBack>( (event, emit) async {
      
      try{
        emit( const SMStateBack() );
        isErrorActive = false;
        emit( SMStateInit(recipesList) );
      }
      catch(e){
        isErrorActive = true;
        emit( const SMStateBack() );
      }

    });

    on<SMEventOpenSearchBar>( (event, emit ){
      if( !isErrorActive ){
        emit( const SMStateOpenSearchBar() );
      }
    });

  }
}
