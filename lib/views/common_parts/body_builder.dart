import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/state_manager_bloc.dart';
import '../recipe_details_view_parts/recipe_details_card.dart';
import '../recipes_list_view_parts/recipes_list_card.dart';

class BodyBuilder extends StatelessWidget {

  const BodyBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget futureChild = Container();
    
    return BlocBuilder< StateManagerBloc, StateManagerState >(
      builder: ( ( context, state ){
        if( state is SMSInit ){

          futureChild = Column(
            children: [
              for(var it in state.recipes.recipes)...[
                RecipesCards( 
                  recipe:   it,
                  callBack: () => BlocProvider.of< StateManagerBloc >( context ).add( const SMEBack() ),
                  canExit:  true,
                )
              ]
            ],
          );
        }
        
        if( state is SMSRecipeSelect ){
          FocusScope.of(context).unfocus();
          futureChild = Column(
            children: [
              RecipeDetailsCard( recipeDetails: state.selectedRecipe ),
            ],
          );
        }

        if( state is SMSSearch ){
          futureChild = Column(
            children: [
              if(state.foundedRecipes != null )...[
                for(var it in state.foundedRecipes!)...[
                  RecipesCards( 
                    recipe:   it,
                    callBack: () => BlocProvider.of< StateManagerBloc >( context ).add( const SMEBack() ),
                    canExit:  false,
                  )
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

