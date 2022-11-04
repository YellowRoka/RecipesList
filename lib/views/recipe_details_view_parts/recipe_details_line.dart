import 'package:flutter/material.dart';

import '../../model/recipe_details.dart';
import '../common_parts/theme.dart';

class DetailsLine extends StatelessWidget {
  const DetailsLine({
    Key? key,
    required this.recipeDetails,
  }) : super(key: key);

  final RecipeDetailsData? recipeDetails;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Text( "${recipeDetails!.kcal.toString()} kcal", style: textStyleDetailsLine ),
          const SizedBox(width: 60, child: VerticalDivider( thickness: 1, indent: 15, endIndent: 15, color: colorTheme5 )),
          Text( "${recipeDetails!.minutes.toString()} minutes", style: textStyleDetailsLine ),
          const SizedBox(width: 60, child: VerticalDivider( thickness: 1, indent: 15, endIndent: 15, color: colorTheme5 )),
          Text( "${recipeDetails!.ingredients.length.toString()} ingredients", style: textStyleDetailsLine ),
        ]
      ),
    );
  }
}
