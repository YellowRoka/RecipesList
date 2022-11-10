import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';

import '../../bloc/state_manager_bloc.dart';
import '../recipe_details_view_parts/recipe_details_card.dart';
import '../recipes_list_view_parts/recipes_list_card.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

import 'circle_loading_bar.dart';
import 'net_error_text_view.dart';

class BodyBuilder extends StatelessWidget {
  const BodyBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget futureChild = Container();
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    
    return BlocBuilder< StateManagerBloc, StateManagerState >(
      buildWhen: ( pastState, actualState ){
        if( ( pastState is SMStateInit && actualState is SMStateBack ) ||
            ( pastState is SMSNetError && actualState is SMStateBack )
        ){
          /*
          if( Platform.isAndroid ){
            SystemNavigator.pop();
          }

          if( Platform.isIOS ) {
            //exit(0); Working on bouth platform but not recomanded
            MinimizeApp.minimizeApp(); --> minimize_app: ^0.1.1 not null safety!
          }*/
          //SystemChannels.platform.invokeMethod('SystemNavigator.pop'); // --> in this case the app still running on background

          //Maybe the best choice: (or need write  methode chanels for bouth platform)
          FlutterExitApp.exitApp();
        }
        return true;
      },

      builder:( ( context, state ){

        if(state is SMSNetError){
          futureChild = const NetErrorTextView();
        }

        if(state is SMStateInitial){
          futureChild = const CircleLoadingBar();
        }

        if( state is SMStateInit ){
          futureChild = ListView.builder(
            shrinkWrap:  true,
            padding:     EdgeInsets.zero,
            itemBuilder: (_, index) => RecipesCards(recipe: state.recipes[index]),
            itemCount:   state.recipes.length,
            
          );
        }
        
        if( state is SMStateRecipeSelect ){
          FocusScope.of(context).unfocus();
          futureChild = Column(
            children: [
              RecipeDetailsCard( recipeDetails: state.selectedRecipe ),
            ],
          );
        }

        if( state is SMStateSearch ){
          if(state.foundedRecipes != null ){
            futureChild = ListView.builder(
              shrinkWrap:  true,
              padding:     EdgeInsets.zero,
              itemBuilder: (_, index) => RecipesCards(recipe: state.foundedRecipes![index]),
              itemCount:   state.foundedRecipes!.length,  
            );
          }
        }

        return SliverToBoxAdapter( child: futureChild );
      }),
    );
  }
}
