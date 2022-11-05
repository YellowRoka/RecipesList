import 'dart:io';

import 'package:ff_recept/di/inject.dart';
import 'package:ff_recept/views/recipe_details_view_parts/recipe_details_card.dart';
import 'package:ff_recept/views/recipes_list_view_parts/recipes_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:ff_recept/main.dart';// as app;

//flutter test --update-goldens integration_test/main_test.dart
//flutter test -d windows --update-goldens integration_test/main_test.dart


void main() async {
  var binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized() as IntegrationTestWidgetsFlutterBinding;
  testWidgets('Test app start', (WidgetTester tester) async {
    await configureDependencies();
    await tester.pumpWidget(const MyApp());
    await binding.convertFlutterSurfaceToImage();
    await tester.pumpAndSettle();

    await expectLater( find.byType(MaterialApp), matchesGoldenFile('golden_files/recipes_list_page.png'));

    //await tester.widgetList(find.byType(RecipesCards).first);

    await tester.tap(find.byType(RecipesCards).first);

    await Future.delayed(const Duration(seconds: 3));

    await tester.pumpAndSettle();
     for(int i = 0; i < 4; i++){
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
    }
    await Future.delayed(const Duration(seconds: 3));

    await expectLater( find.byType(MaterialApp), matchesGoldenFile('golden_files/selected_recipe_page.png'));
    
    await binding.takeScreenshot('android_screenshot');

    //expect(find.byType(RecipesCards), findsWidgets);

    //final Finder widgets = find.byElementType(RecipesCards);

    //await tester.tap(widgets.first);
    //await tester.tap(find.byType(RecipesCards));
    //await tester.enterText( find.byType(FormBuilderTextField).last, '12');
    //await tester.tap(find.byType(ElevatedButton));
    //for(int i = 0; i < 4; i++){
   //   await Future.delayed(Duration(seconds: 1));
    //  await tester.pumpAndSettle();
    //}
    
    //await expectLater( find.byType(MaterialApp), matchesGoldenFile('start_page.png') );
    //await binding.takeScreenshot('android_screenshot');
  });
}

/*
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the first image button', (tester) async {

      app.main();

      await tester.pumpAndSettle();

      expect(find.byType(CustomScrollView), findsOneWidget);

      await Future.delayed(const Duration(milliseconds: 7000) );
      // Verify the counter starts at 0.
      expect(find.byType(RecipesCards), findsWidgets);
      
      final Finder widgets = find.byElementType(RecipesCards);

      // Emulate a tap on the floating action button.
      await tester.tap(widgets.first);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.byElementType(RecipeDetailsCard), findsOneWidget);
    });
  });
}
*/