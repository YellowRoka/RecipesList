import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/state_manager_bloc.dart';
import 'default_app_bar.dart';
import 'search_app_bar.dart';

class AppBarHandler extends StatelessWidget {

  const AppBarHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSearchActive = false;

    return BlocBuilder<StateManagerBloc, StateManagerState>(
      builder: (context, state) {

        if( state is SMStateOpenSearchBar ){
            isSearchActive = true;
        }

        if( state is SMStateBack  || state is SMStateInit){
          isSearchActive = false;
        }

        return
        ( isSearchActive )?
        ( const SearchAppBar() ):
        ( const RecipeAppBar() );
      },
    );
  }
}
