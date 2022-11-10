import 'package:ff_recept/views/common_parts/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/state_manager_bloc.dart';
import '../common_parts/universal_button.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

class SearchAppBar extends StatefulWidget{

  
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  late TextEditingController controller;

  @override
  void initState(){
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  
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

      flexibleSpace: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB( 70, 1, 10, 1 ),
          height:  56,
          child:   TextField( 
            style:       textStyleBase,
            cursorColor: colorTheme1,
            controller:  controller,
      
            decoration: InputDecoration(
              hintText: localizations.textSearchHint,
      
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:   const BorderSide( color: colorTheme1 ),
              ),
      
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:   const BorderSide( color: colorTheme1 ),
              )
            ),
      
            onChanged: (input) => setState( 
              () => BlocProvider.of< StateManagerBloc >( context ).add( SMEventSearch( input ) )
            )
      
          ),
      
        ),
      ),
    );
  }
}
