import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/state_manager_bloc.dart';
import '../recipe_details_view_parts/recipe_details_card.dart';
import '../recipes_list_view_parts/recipes_list_card.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

class BodyBuilder extends StatelessWidget {
  final AppLocalizations localizations;

  const BodyBuilder({Key? key, required this.localizations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget futureChild = Container();
    
    return BlocBuilder< StateManagerBloc, StateManagerState >(
      buildWhen: (pastState,actualState ){
        if(pastState is SMSInit && actualState is SMSBack ){
          exit(0);
        }
        return true;
      },

      builder: ( ( context, state ){

        if( state is SMSInit ){
          futureChild = Column(
            children: [
              for( var it in state.recipes.recipes )...[
                RecipesCards( recipe: it )
              ]
            ],
          );
        }
        
        if( state is SMSRecipeSelect ){
          FocusScope.of(context).unfocus();
          futureChild = Column(
            children: [
              RecipeDetailsCard( recipeDetails: state.selectedRecipe, localizations: localizations ),
            ],
          );
        }

        if( state is SMSSearch ){
          futureChild = Column(
            children: [
              if(state.foundedRecipes != null )...[
                for(var it in state.foundedRecipes!)...[
                  RecipesCards( recipe: it )
                ]
              ]
            ],
          );
        }

        return SliverToBoxAdapter( child: futureChild );
      }),
    );
  }
}
