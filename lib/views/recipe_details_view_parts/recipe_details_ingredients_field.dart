import 'package:flutter/material.dart';

import '../../model/recipe_details.dart';
import '../common_parts/theme.dart';

class IngredientsFiled extends StatelessWidget {
  const IngredientsFiled({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  final List<IngredientsData?>? ingredients;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: colorTheme4,
      
      width: MediaQuery.of( context ).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          const Text( "Ingredients", style: textStyleIngredientsBig ),
          for( var it in ingredients! )...[
            Row(
              children: [
                if(it?.ing_name != null)...[
                  const Icon(Icons.circle, color: colorTheme5, size: 6 ),
                  const SizedBox(width: 10),
                  Text( it?.ing_name??"", style: textStyleIngredientsSmall ),  
                ]
              ],
            ),
          ]
        ]
      ),
    );
  }
}
