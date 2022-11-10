import 'package:flutter/material.dart';

import '../data_model/recipe_details.dart';
import '../data_model/recipes.dart';
import '../views/app_bar_parts/app_bar_handler.dart';
import '../views/common_parts/circle_loading_bar.dart';
import '../views/common_parts/net_error_text_view.dart';
import '../views/recipe_details_view_parts/recipe_details_card.dart';
import '../views/recipes_list_view_parts/recipes_listview.dart';
import '../views/search_view/search_recipes_listview.dart';


PageRouteBuilder<dynamic> dinamicRoutForError ( RouteSettings settings ){

  return PageRouteBuilder(
    settings:    settings,
    pageBuilder: ( context, animation, secundaryAnimation ) => 
      const CustomScrollView(
        slivers: [ 
          AppBarHandler(),
          SliverToBoxAdapter(
            child: NetErrorTextView()
          )
        ]
      ),
  );
}

PageRouteBuilder<dynamic> dinamicRoutForLoading ( RouteSettings settings ){

  return PageRouteBuilder(
    settings:    settings,
    pageBuilder: ( context, animation, secundaryAnimation ) => 
      const CustomScrollView(
        slivers: [ 
          AppBarHandler(),
          SliverToBoxAdapter(
            child: CircleLoadingBar()
          )
        ]
      ),
  );
}

PageRouteBuilder<dynamic> dinamicRoutForInited ( RouteSettings settings, Object? arguments ){

  final List<RecipeData> recipeList = arguments as List<RecipeData>;

  return PageRouteBuilder(
    settings:    settings,
    pageBuilder: ( context, animation, secundaryAnimation ) => 
      Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: [  
            const AppBarHandler(),
            SliverToBoxAdapter(
              child: RecipesListView(recipes: recipeList)
            )
          ]
        ),
      ),
  );
}

PageRouteBuilder<dynamic> dinamicRoutForSelectedRecipe ( RouteSettings settings, Object? arguments ){

  final RecipeDetailsData recipeDetails = arguments as RecipeDetailsData;

  return PageRouteBuilder(
    settings:    settings,
    pageBuilder: ( context, animation, secundaryAnimation ) =>  
      Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: [ 
            const AppBarHandler(),
            SliverToBoxAdapter(
              child: RecipeDetailsCard( recipeDetails: recipeDetails )
            ),
          ],
        ),
      )
  );
}

PageRouteBuilder<dynamic> dinamicRoutForSearching ( RouteSettings settings ){

  return PageRouteBuilder(
    settings:    settings,
    pageBuilder: ( context, animation, secundaryAnimation ){

      return Container(
        color: Colors.white,
        child: const CustomScrollView(
          slivers: [
            AppBarHandler(),
            SliverToBoxAdapter(
              child: SearchRecipesListView()
            )
          ]
        ),
      );
    },
  );
}
