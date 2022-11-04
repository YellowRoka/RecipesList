import 'package:flutter/material.dart';

import '../../data_model/recipe_details.dart';
import '../common_parts/theme.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

class DetailsHead extends StatelessWidget {
  final int                imageHeight;
  final Image              image;
  final RecipeDetailsData? recipeDetails;
  final AppLocalizations   localizations;

  const DetailsHead({ Key? key, required this.imageHeight, required this.image, required this.recipeDetails, required this.localizations }) : super(key: key);

  @override
  Widget build( BuildContext context ){
    return Stack(
      children: [
        _backGroundBox(),
        _details( context ),
      ],
    );
  }


  Widget _recipeName() => Text( 
    recipeDetails!.name, 
    overflow: TextOverflow.clip, 
    style:    textStyleDetailsHead1
  );

  Widget _iconisedCreationTime() => Row(
    children: [
      const Icon( Icons.watch_later_outlined, color: colorTheme2 ),
      const SizedBox( width: 10 ),
      Text( "${recipeDetails!.minutes.toString()} ${localizations.textMinutes}", style: textStyleDetailsHead2 )
    ]
  );

  Widget _details( BuildContext context ) => Column(
    mainAxisAlignment:  MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Container(
        padding: const EdgeInsets.fromLTRB( 20, 0, 0, 20 ),
        width:   MediaQuery.of( context ).size.width * 0.60, 
        child:   Column(
          children: [

            _recipeName(),
            const SizedBox( height: 10 ),
            _iconisedCreationTime()
            
          ],
        )
      ),
    ],
  );

  Widget _backGroundBox() => SizedBox(
    height: imageHeight*0.35,
    child:  image,
  );
}
