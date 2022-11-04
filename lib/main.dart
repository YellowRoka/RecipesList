import 'package:ff_recept/bloc/state_manager_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'views/app_bar_parts/app_bar_handler.dart';
import 'views/common_parts/body_builder.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

void main() => runApp( const MyApp() );


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider<StateManagerBloc>(
      create: (context) => StateManagerBloc()..add( const SMEInit() ),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,

        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('hu', ''), // Hungarian, no country code
        ],
        locale: const Locale('en'),

        title: 'Recipe View',
        home:  Builder(
          builder: ( context ){
            final AppLocalizations localizations = AppLocalizations.of(context)!;

            return Scaffold(
              body: CustomScrollView(
                slivers:[
                  AppBarHandler( localizations: localizations ),
                  BodyBuilder(   localizations: localizations )
                ],
              )
            );
          }
        )
      ),
    );
  }
}
