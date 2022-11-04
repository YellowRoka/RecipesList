import 'package:ff_recept/views/common_parts/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/state_manager_bloc.dart';
import '../common_parts/universal_button.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ){
    final TextEditingController controller = TextEditingController();

    return SliverAppBar(
      backgroundColor: colorBacground,
      toolbarHeight:   58,
      expandedHeight:  58,
      leadingWidth:    58,
      floating:        false,
      pinned:          false,
      leading:         Row(
        children: [
          const SizedBox( width: 10 ),
          UniversalButton( 
            size:     48,
            icon:     Icons.arrow_back_sharp,
            callBack: () => BlocProvider.of< StateManagerBloc >( context ).add( const SMEBack() ) ),
        ],
      ),

      flexibleSpace: Column(
        mainAxisAlignment:  MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children:[ 
          const SizedBox( height: 32 ),

          Container(
            padding: const EdgeInsets.fromLTRB(1, 1, 10, 1),
            width:   330,
            height:  56,
            child:   TextField( 
              style:       textStyleBase,
              cursorColor: colorTheme1,

              decoration: InputDecoration(
                hintText: "Just start typing here...",

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:   const BorderSide( color: colorTheme1 ),
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:   const BorderSide( color: colorTheme1 ),
                )
              ),

              controller: controller,
              onChanged:  (input) => BlocProvider.of< StateManagerBloc >( context ).add( SMESearch( input ) ),
            ),
          ),
        ]
      ),
    );
  }
}
