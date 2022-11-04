import 'package:flutter/material.dart';

import '../../model/recipe_details.dart';
import '../common_parts/theme.dart';

class PreparationFiled extends StatelessWidget {
  const PreparationFiled({
    Key? key,
    required this.steps,
  }) : super(key: key);

  final String steps;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all( 16 ),
      width:   MediaQuery.of( context ).size.width,
      child:   Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25, child: Text( "Preparation", style: textStylePreparationBig ) ),
          Text( steps, overflow: TextOverflow.clip, style: textStylePreparationSmall, ),
        ],
      ),
    );
  }
}
