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
      if(Platform.isAndroid) await binding.convertFlutterSurfaceToImage();

    print("Find loading bar");
      await tester.tap(find.byType(CircleLoadingBar).first);
      await expectLater( find.byType(MaterialApp), matchesGoldenFile('golden_files/1_loading.png'));

    print("Show recipes");
      await tester.pumpAndSettle();
      await expectLater( find.byType(MaterialApp), matchesGoldenFile('golden_files/2_recipes_list_page.png'));

    print("Select the first recipe");
      await tester.tap(find.byType(RecipesCards).first);
      await tester.pumpAndSettle();
      for(int i = 0; i < 4; i++){
        await Future.delayed(const Duration(seconds: 1));
        await tester.pumpAndSettle();
      }
      await expectLater( find.byType(MaterialApp), matchesGoldenFile('golden_files/3_selected_recipe_page.png'));
    
    print("Open Searchbar");
      await tester.tap(find.widgetWithIcon(UniversalButton,Icons.search));
      await tester.pumpAndSettle();
      await expectLater( find.byType(MaterialApp), matchesGoldenFile('golden_files/4_open_search_bar.png'));

    print("Search a recipe");
      await tester.enterText(find.byType(TextField), "asparagus");
      for(int i = 0; i < 4; i++){
        await Future.delayed(const Duration(seconds: 1));
        await tester.pumpAndSettle();
      }
      await expectLater( find.byType(MaterialApp), matchesGoldenFile('golden_files/5_recipes_searched.png'));

    print("Select the first searched recipe");
      await tester.tap(find.byType(RecipesCards).first);

      await tester.pumpAndSettle();
      for(int i = 0; i < 4; i++){
        await Future.delayed(const Duration(seconds: 1));
        await tester.pumpAndSettle();
      }
      await expectLater( find.byType(MaterialApp), matchesGoldenFile('golden_files/6_select_searched_recipe.png'));

    print("Back to recipes list");
      await tester.tap(find.byType(UniversalButton));
      await tester.pumpAndSettle();
      await expectLater( find.byType(MaterialApp), matchesGoldenFile('golden_files/7_back_home_page.png'));


    if(Platform.isAndroid) await binding.takeScreenshot('android_screenshot');

  });
}
