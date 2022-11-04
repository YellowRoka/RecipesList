import 'package:flutter/material.dart';

import '../../model/recipe_details.dart';
import '../common_parts/theme.dart';

class DetailsHead extends StatelessWidget {
  const DetailsHead({
    Key? key,
    required this.imageHeight,
    required this.image,
    required this.recipeDetails,
  }) : super(key: key);

  final int                imageHeight;
  final Image              image;
  final RecipeDetailsData? recipeDetails;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        SizedBox(
          height: imageHeight*0.35,
          child: image,
        ),
        
        Column(
          mainAxisAlignment:  MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB( 20, 0, 0, 20 ),
              width:   MediaQuery.of( context ).size.width * 0.60, 
              child:   Column(
                children: [
                  Text( recipeDetails!.name, 
                    overflow: TextOverflow.clip, 
                    style:    textStyleDetailsHead1
                  ),
                  const SizedBox( height: 10 ),

                  Row(
                    children: [
                      const Icon( Icons.watch_later_outlined, color: colorTheme2 ),
                      const SizedBox(width: 10),
                      Text( "${recipeDetails!.minutes.toString()} minutes", style: textStyleDetailsHead2 )
                    ]
                  )
                  
                ],
              )
            ),
          ],
        )
        
      ],
    );
  }
}
