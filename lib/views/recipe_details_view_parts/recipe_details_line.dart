import 'package:flutter/material.dart';

import '../../data_model/recipe_details.dart';
import '../common_parts/theme.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

class DetailsLine extends StatelessWidget {
  final RecipeDetailsData? recipeDetails;

  const DetailsLine({ Key? key, required this.recipeDetails }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return SizedBox(
      height: 50,
      child:  Row(
        mainAxisAlignment:  MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _ingredientText( "${recipeDetails!.kcal.toString()} ${localizations.textKcal}" ),
          _verticalDivider(),
          _ingredientText( "${recipeDetails!.minutes.toString()} ${localizations.textMinutes}" ),
          _verticalDivider(),
          _ingredientText( "${recipeDetails!.ingredients.length.toString()} ${localizations.textingredients}" ),
        ]
      ),
    );
  }
  
  Widget _verticalDivider() => const SizedBox(
    width: 60, 
    child: VerticalDivider( 
      thickness: 1, 
      indent:    15, 
      endIndent: 15, 
      color:     colorTheme5
    )
  );

  Widget _ingredientText( String data ) => Text( 
    data,
    style: textStyleDetailsLine
  );

}
