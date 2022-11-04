import 'package:ff_recept/bloc/state_manager_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'views/app_bar_parts/app_bar_handler.dart';
import 'views/common_parts/body_builder.dart';

void main() => runApp( const MyApp() );


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider<StateManagerBloc>(
      create: (context) => StateManagerBloc()..add( const SMEInit() ),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        //theme: themeData,
        title: 'Recipe View',
        home: Builder(
          builder: (context) {
            return const Scaffold(
              body: CustomScrollView(
                slivers:[
                  AppBarHandler(),
                  BodyBuilder()
                ],
              )
            );
          }
        )
      ),
    );
  }
}
