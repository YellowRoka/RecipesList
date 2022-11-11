import 'dart:io';

import 'package:ff_recept/di/inject.dart';
import 'package:ff_recept/views/common_parts/circle_loading_bar.dart';
import 'package:ff_recept/views/common_parts/universal_button.dart';
import 'package:ff_recept/views/recipes_list_view_parts/recipes_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:ff_recept/main.dart';

// yet not supported on android devices:
//flutter test --update-goldens integration_test/main_test.dart                   // run integration test on default selected device
//flutter test -d ${DEVICEID} --update-goldens integration_test/main_test.dart    // run integration test given (android) device
// supported:
//flutter test -d windows --update-goldens integration_test/main_test.dart        // run integration test on Windows

void main() async {

  var binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized() as IntegrationTestWidgetsFlutterBinding;
  testWidgets( 'Testing app', (WidgetTester tester) async {

    print("Start app");
      await configureDependencies();
      await tester.pumpWidget( const MyApp() );
/*
    print("Find loading bar");
    
      await tester.tap(find.byType(CircleLoadingBar).first);

      if(Platform.isAndroid) {
        await binding.convertFlutterSurfaceToImage();
        await binding.takeScreenshot('1_loading');
        await expectLater( find.byType(MaterialApp), matchesGoldenFile('golden_files/1_loading.png'));
      }
      
      if(Platform.isWindows) await expectLater( find.byType(MaterialApp), matchesGoldenFile('screenshot/1_loading.png'));
*/
    print("Show recipes");
      await tester.pumpAndSettle(const Duration(milliseconds: 2000),EnginePhase.sendSemanticsUpdate, const Duration(minutes: 10) );

      if(Platform.isAndroid) {
        await binding.takeScreenshot('2_recipes_list_page');
        await expectLater( find.byType(MaterialApp), matchesGoldenFile('screenshot/2_recipes_list_page.png'));
      }
      
      if(Platform.isWindows) await expectLater( find.byType(MaterialApp), matchesGoldenFile('golden_files/2_recipes_list_page.png'));

    print("Select the first recipe");
      await tester.tap(find.byType(RecipesCards).first);
      await tester.pumpAndSettle(const Duration(milliseconds: 2000),EnginePhase.sendSemanticsUpdate, const Duration(minutes: 10) );

      for(int i = 0; i < 4; i++){
        await Future.delayed(const Duration(seconds: 1));
        await tester.pumpAndSettle();
      }

      if(Platform.isAndroid) {
        await binding.takeScreenshot('3_selected_recipe_page');
        await expectLater( find.byType(MaterialApp), matchesGoldenFile('screenshot/3_selected_recipe_page.png'));
      }

      if(Platform.isWindows) await expectLater( find.byType(MaterialApp), matchesGoldenFile('golden_files/3_selected_recipe_page.png'));
    
    print("Open Searchbar");
      await tester.tap(find.widgetWithIcon(UniversalButton,Icons.search));
      await tester.pumpAndSettle(const Duration(milliseconds: 2000),EnginePhase.sendSemanticsUpdate, const Duration(minutes: 10) );

      if(Platform.isAndroid) {
        await binding.takeScreenshot('4_open_search_bar');
        await expectLater( find.byType(MaterialApp), matchesGoldenFile('screenshot/4_open_search_bar.png'));
      }

      if(Platform.isWindows) await expectLater( find.byType(MaterialApp), matchesGoldenFile('golden_files/4_open_search_bar.png'));

    print("Search a recipe");
      await tester.enterText(find.byType(TextField), "asparagus");
      for(int i = 0; i < 4; i++){
        await Future.delayed(const Duration(seconds: 1));
        await tester.pumpAndSettle(const Duration(milliseconds: 2000),EnginePhase.sendSemanticsUpdate, const Duration(minutes: 10) );
      }

      if(Platform.isAndroid) {
        await binding.takeScreenshot('5_recipes_searched');
        await expectLater( find.byType(MaterialApp), matchesGoldenFile('screenshot/5_recipes_searched.png'));
      }
      if(Platform.isWindows) await expectLater( find.byType(MaterialApp), matchesGoldenFile('golden_files/5_recipes_searched.png'));

    print("Select the first searched recipe");
      await tester.tap(find.byType(RecipesCards).first);

      await tester.pumpAndSettle(const Duration(milliseconds: 2000),EnginePhase.sendSemanticsUpdate, const Duration(minutes: 10) );
      for(int i = 0; i < 4; i++){
        await Future.delayed(const Duration(seconds: 1));
        await tester.pumpAndSettle();
      }

      if(Platform.isAndroid) {
        await binding.takeScreenshot('6_select_searched_recipe');
        await expectLater( find.byType(MaterialApp), matchesGoldenFile('screenshot/6_select_searched_recipe.png'));
      }

      if(Platform.isWindows) await expectLater( find.byType(MaterialApp), matchesGoldenFile('golden_files/6_select_searched_recipe.png'));

    print("Back to recipes list");
      print(find.byType(UniversalButton));
      await tester.tap(find.byType(UniversalButton).first);
      await tester.pumpAndSettle(const Duration(milliseconds: 2000),EnginePhase.sendSemanticsUpdate, const Duration(minutes: 10) );
      
      if(Platform.isAndroid) {
        await binding.takeScreenshot('7_back_home_page');
        await expectLater( find.byType(MaterialApp), matchesGoldenFile('screenshot/7_back_home_page.png'));
      }
      
      if(Platform.isWindows) await expectLater( find.byType(MaterialApp), matchesGoldenFile('golden_files/7_back_home_page.png'));

  });
}
