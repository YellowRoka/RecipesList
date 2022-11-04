
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/state_manager_bloc.dart';
import '../../model/recipe_details.dart';
import 'recipe_details_head.dart';
import 'recipe_details_ingredients_field.dart';
import 'recipe_details_line.dart';
import 'recipe_details_preparation_filed.dart';

class RecipeDetailsCard extends StatefulWidget {
  final RecipeDetailsData? recipeDetails;

  const RecipeDetailsCard( {Key? key, this.recipeDetails}) : super(key: key);

  @override
  State<RecipeDetailsCard> createState() => _RecipeDetailsCardState();
}

class _RecipeDetailsCardState extends State<RecipeDetailsCard> {
  late Image image;
  late int   imageHeight = 0;
  bool       _isLoading  = true;



  @override
  void initState(){
    image = Image.network(widget.recipeDetails!.imageUrl, fit: BoxFit.fill);

    image.image
      .resolve( const ImageConfiguration() )
      .addListener( ImageStreamListener(
        ( imageinfo, mounted ){
          setState( (){
            _isLoading  = false;
            imageHeight = imageinfo.image.height;
          });
        }
      )
    );

    super.initState();
  }

  @override
  Widget build( BuildContext context ){


    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of< StateManagerBloc >( context ).add( const SMEBack() );
        return false;
      },
      child: 
      ( _isLoading  )?
      ( const CircularProgressIndicator() ):
      ( 
        Column(
          children: [
            SizedBox(
              height: imageHeight*0.35,
              child: ( 
                DetailsHead(imageHeight: imageHeight, image: image, recipeDetails: widget.recipeDetails )
              ),
            ),
            
            DetailsLine(      recipeDetails: widget.recipeDetails              ),
            IngredientsFiled( ingredients:   widget.recipeDetails!.ingredients ),
            PreparationFiled( steps:         widget.recipeDetails!.steps       )
          ],
        )
      )
    );
  }
}
