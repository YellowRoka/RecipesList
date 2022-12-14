import 'package:ff_recept/views/common_parts/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/state_manager_bloc.dart';
import '../common_parts/universal_button.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

class RecipeAppBar extends StatelessWidget {

  const RecipeAppBar({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ){
     final AppLocalizations localizations = AppLocalizations.of(context)!;

    return SliverAppBar(
      backgroundColor: colorBacground,
      toolbarHeight:   58,
      expandedHeight:  58,
      leadingWidth:    58,
      floating:        false,
      pinned:          true,
      leading:         Row(
        children: [
          const SizedBox( width: 10 ),
          UniversalButton( 
            size:     48,
            icon:     Icons.arrow_back_sharp,
            callBack: () => BlocProvider.of< StateManagerBloc >( context ).add( const SMEventBack() ) ),
        ],
      ),

      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title:       Text( localizations.textBreakfast, style: textStyleBase ),
      ),

      actions: [
        UniversalButton( 
          size:     48, 
          icon:     Icons.search,
          callBack: () => BlocProvider.of< StateManagerBloc >( context ).add( const SMEventOpenSearchBar() ) 
        ),
        const SizedBox( width: 10 )
      ],
    );
  }
}
