
import 'package:ff_recept/bloc/state_manager_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_model/recipes.dart';
import '../common_parts/theme.dart';

typedef BoolCallback = Future<bool> Function();

class RecipesCards extends StatefulWidget {
  final RecipeData?  recipe;
  final VoidCallback callBack;
  final bool         canExit;

  const RecipesCards( {Key? key, this.recipe, required this.callBack, required this.canExit}) : super(key: key);

  @override
  State<RecipesCards> createState() => _RecipesCardsState();
}

class _RecipesCardsState extends State< RecipesCards >{
  late Image image;
  late int   imageHeight;
  late bool  isLoading;


  @override
  void initState(){
    isLoading  = true;
    imageHeight = 0;

    image = Image.network( widget.recipe!.imageUrl, fit: BoxFit.fill );

    image.image
      .resolve( const ImageConfiguration() )
      .addListener( ImageStreamListener(
        ( imageinfo, mounted ){
          setState( (){
            isLoading   = false;
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
        widget.callBack; 
        return widget.canExit;
      },

      child: SizedBox(
        height: 0.0 + imageHeight * 0.35,
        width:  MediaQuery.of( context ).size.width,
        child: 
        ( isLoading                         )?
        ( const CircularProgressIndicator() ):
        ( 
          GestureDetector(
            onTap: () => BlocProvider.of< StateManagerBloc >( context ).add( SMERecipeSelect( widget.recipe!.id ) ),
            child: ( 
              Stack(
                children: [
          
                  SizedBox(
                    height: imageHeight * 0.35,
                    child:  image,
                  ),
          
                  Column(
                    mainAxisAlignment:  MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB( 20, 0, 0, 20 ),
                        width:   MediaQuery.of( context ).size.width * 0.60, 
                        child:   Text( widget.recipe!.name, 
                          overflow: TextOverflow.clip, 
                          maxLines: 3,
                          style:    textStyleDetailsHead1
                        )
                      ),
                    ],
                  )
          
                ],
              )
            ),
          )
        )
      ),
    );
  }
}
