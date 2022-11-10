import 'package:flutter/material.dart';

import '../common_parts/theme.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

class PreparationField extends StatelessWidget {
  final String steps;

  const PreparationField({ Key? key, required this.steps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all( 16 ),
      width:   MediaQuery.of( context ).size.width,
      child:   Column(
        mainAxisAlignment:  MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25, 
            child:  Text( localizations.textPreparation, style: textStylePreparationBig ) 
          ),
          Text( 
            steps, 
            overflow: TextOverflow.clip, 
            style:    textStylePreparationSmall
          ),
        ],
      ),
    );
  }
}
