import 'package:flutter/material.dart';

import '../../data_model/recipe_details.dart';
import '../common_parts/theme.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

class IngredientsField extends StatelessWidget {
  final List<IngredientsData?>? ingredients;

  const IngredientsField({ Key? key, required this.ingredients }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(16),
      color:   colorTheme4,
      
      width: MediaQuery.of( context ).size.width,
      child: Column(
        mainAxisAlignment:  MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[

          Text( localizations.textIngredients, style: textStyleIngredientsBig ),

          for( var it in ingredients! )...[
            Row(
              children: [
                if( it?.ingName != null )...[
                  const Icon( Icons.circle, color: colorTheme5, size: 6 ),
                  const SizedBox( width: 10 ),
                  Text( it?.ingName??"", style: textStyleIngredientsSmall ),  
                ]
              ],
            ),
          ]

        ]
      ),
    );
  }
}
