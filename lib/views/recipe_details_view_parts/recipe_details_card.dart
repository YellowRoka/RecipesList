import 'package:flutter/material.dart';

import '../../data_model/recipe_details.dart';
import '../common_parts/CircleLoadingBar.dart';
import 'recipe_details_head.dart';
import 'recipe_details_ingredients_field.dart';
import 'recipe_details_line.dart';
import 'recipe_details_preparation_field.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

class RecipeDetailsCard extends StatefulWidget {
  final RecipeDetailsData? recipeDetails;
  final AppLocalizations   localizations;

  const RecipeDetailsCard( {Key? key, this.recipeDetails, required this.localizations}) : super(key: key);

  @override
  State<RecipeDetailsCard> createState() => _RecipeDetailsCardState();
}

class _RecipeDetailsCardState extends State<RecipeDetailsCard> {
  late Image image;
  late int   imageHeight;
  late int   imageWidth;
  late bool  isLoading;

  @override
  void initState(){
    imageHeight = 0;
    imageWidth  = 0;
    isLoading   = true;

    image = Image.network( widget.recipeDetails!.imageUrl, fit: BoxFit.fill );

    image.image
      .resolve( const ImageConfiguration() )
      .addListener( ImageStreamListener(
        ( imageinfo, mounted ){
          setState( (){
            isLoading   = false;
            imageHeight = imageinfo.image.height;
            imageWidth  = imageinfo.image.width;
          });
        }
      )
    );

    super.initState();
  }

  @override
  Widget build( BuildContext context ){


    return 
      ( isLoading                )?
      ( const CircleLoadingBar() ):
      ( 
        Column(
          children: [
            SizedBox(
              height: imageHeight*0.35,
              child:  ( 
                DetailsHead( imageHeight: imageHeight, image: image, recipeDetails: widget.recipeDetails, localizations: widget.localizations, imageWidth: imageWidth, )
              ),
            ),
            
            DetailsLine(      recipeDetails: widget.recipeDetails,              localizations: widget.localizations ),
            IngredientsField( ingredients:   widget.recipeDetails!.ingredients, localizations: widget.localizations ),
            PreparationField( steps:         widget.recipeDetails!.steps,       localizations: widget.localizations )
          ],
        )
      );
  }
}
