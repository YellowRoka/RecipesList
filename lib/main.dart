import 'package:ff_recept/bloc/state_manager_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'di/inject.dart';
import 'routes/dinamic_routes_handler.dart';
import 'views/common_parts/route_builder.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

void main() async {
  await configureDependencies();
  runApp( const MyApp() );
} 

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StateManagerBloc>(
      create: (context) => getIt<StateManagerBloc>(),
      child:  MaterialApp(

        //theme: appTheme,
        debugShowCheckedModeBanner: false,

        onGenerateRoute: (settings){

          if(settings.name?.startsWith('/error')??false){
            return dinamicRoutForError(settings);
          }

          if(settings.name?.startsWith('/inited')??false){
            return dinamicRoutForInited(settings, settings.arguments);
          }

          if(settings.name?.startsWith('/selectedrecipe')??false){
            return dinamicRoutForSelectedRecipe(settings, settings.arguments);
          }

          if(settings.name?.startsWith('/searching')??false){
            return dinamicRoutForSearching(settings);
          }

          if(settings.name?.startsWith('/loading')??false){
            return dinamicRoutForLoading(settings);
          }

          return dinamicRoutForLoading(settings);

        },

        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), /* English, no country code   */
          Locale('hu', ''), /* Hungarian, no country code */
        ],
        locale: const Locale('en'),

        title: 'Recipe View',
        home:  Builder(
          builder: ( context ){
            context.read<StateManagerBloc>().add( const SMEventInit() );

            return (
              WillPopScope(
                onWillPop: () async {
                  BlocProvider.of< StateManagerBloc >( context ).add( const SMEventBack() );
                  return false;
                },
                child: const Scaffold(
                  body: RouteBuilder()
                )
              )
            );
          }
        )
      ),
    );
  }
}
