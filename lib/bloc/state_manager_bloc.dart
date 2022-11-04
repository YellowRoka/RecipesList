import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../cloud_functions/web_handler.dart';
import '../cloud_functions/web_handler_injectable.dart';
import '../data_model/recipes.dart';
import '../data_model/recipe_details.dart';
import '../di/module/dio_module.dart';

part 'state_manager_event.dart';
part 'state_manager_state.dart';

@injectable
class StateManagerBloc extends Bloc<StateManagerEvent, StateManagerState> {

  late WebServiceInterface webService;
  late JSONRecipes         recipesList;

  StateManagerBloc(DioInjectable dioInjectable) : super( const SMSInitial() ) {

    on<SMEInit>( (event, emit) async {
      webService  = WebServiceHandler(dioInjectable);
      recipesList = await webService.getreceptList();
      emit( SMSInit(recipesList) );
    });

    on<SMERecipeSelect>( (event, emit) async {
      webService  = WebServiceHandler(dioInjectable);
      
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
