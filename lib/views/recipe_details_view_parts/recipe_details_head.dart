import 'package:flutter/material.dart';

import '../../data_model/recipe_details.dart';
import '../common_parts/theme.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

class DetailsHead extends StatelessWidget {
  final int                imageHeight;
  final int                imageWidth;
  final Image              image;
  final RecipeDetailsData? recipeDetails;

  const DetailsHead({ Key? key, required this.imageHeight, required this.image, required this.recipeDetails, required this.imageWidth }) : super(key: key);

  @override
  Widget build( BuildContext context ){
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        _backGroundBox(),
        _details( context, localizations ),
      ],
    );
  }


  Widget _recipeName() => SizedBox(
    width:   0.0 + imageWidth *0.16, 
    child: Text( 
      recipeDetails!.name, 
      overflow: TextOverflow.clip, 
      maxLines: 3,
      style:    textStyleDetailsHead1
    ),
  );

  Widget _iconisedCreationTime(AppLocalizations localizations) => Row(
    children: [
      const Icon( Icons.watch_later_outlined, color: colorTheme2 ),
      const SizedBox( width: 10 ),
      Text( "${recipeDetails!.minutes.toString()} ${localizations.textMinutes}", style: textStyleDetailsHead2 )
    ]
  );

  Widget _details( BuildContext context, AppLocalizations localizations ) => Column(
    mainAxisAlignment:  MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Container(
        padding: const EdgeInsets.fromLTRB( 20, 0, 0, 20 ),
        width:   0.0 + imageWidth *0.35,
        child:   Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            _recipeName(),
            const SizedBox( height: 10 ),
            _iconisedCreationTime(localizations)
            
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
