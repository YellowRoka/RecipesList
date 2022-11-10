import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';

import '../../bloc/state_manager_bloc.dart';

class RouteBuilder extends StatelessWidget {
  const RouteBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return BlocListener< StateManagerBloc, StateManagerState >(
      listenWhen: ( pastState, actualState ){
        if( ( pastState is SMStateInit && actualState is SMStateBack ) ||
            ( pastState is SMSNetError && actualState is SMStateBack )
        ){
            FlutterExitApp.exitApp();
        }

        return true;
      },

      listener:( ( context, state ){
        
        if(state is SMSNetError){
          Navigator.pushNamed( context, "/error" );
        }

        if(state is SMStateInitial){
          Navigator.pushNamed( context, "/loading");
        }

        if( state is SMStateInit ){
          Navigator.pushNamed( context, "/inited", arguments: state.recipes);
        }
        
        if( state is SMStateRecipeSelect ){
          FocusScope.of(context).unfocus();
          Navigator.pushNamed( context, "/selectedrecipe", arguments: state.selectedRecipe);
        }

        if( state is SMStateOpenSearchBar ){
          Navigator.pushNamed( context, "/searching" );
        }

        if( state is SMStateBack  || state is SMStateInit){
        } 
      } ),

      child: const SizedBox( height:1 ),
    );
  }
}
