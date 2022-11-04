import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/state_manager_bloc.dart';
import 'default_app_bar.dart';
import 'search_app_bar.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';


class AppBarHandler extends StatelessWidget {
  final AppLocalizations localizations;

  const AppBarHandler({Key? key, required this.localizations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSearchActive = false;

    return BlocBuilder<StateManagerBloc, StateManagerState>(
      builder: (context, state) {

        if( state is SMSOpenSearchBar ){
            isSearchActive = true;
        }

        if( state is SMSBack ){
          isSearchActive = false;
        }

        return
        ( isSearchActive                               )?
        ( SearchAppBar( localizations: localizations ) ):
        ( RecipeAppBar( localizations: localizations ) );
      },
    );
  }
}