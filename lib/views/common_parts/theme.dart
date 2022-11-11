import 'package:flutter/material.dart';

const colorBacground = Colors.white;
const colorTheme1    = Colors.black;
const colorTheme2    = Colors.white;
final colorTheme3    = Colors.grey[200];
final colorTheme4    = Colors.grey[300];
const colorTheme5    = Colors.grey;

const textStyleDetailsHead1     = TextStyle( color: Colors.white, fontFamily: "arial", fontSize: 18, fontWeight: FontWeight.bold,   decoration: TextDecoration.none );
const textStyleDetailsHead2     = TextStyle( color: Colors.white, fontFamily: "arial", fontSize: 16, fontWeight: FontWeight.normal, decoration: TextDecoration.none );
const textStyleDetailsLine      = TextStyle( color: Colors.grey,  fontFamily: "arial", fontSize: 16, fontWeight: FontWeight.normal, decoration: TextDecoration.none );
const textStyleIngredientsBig   = TextStyle( color: Colors.grey,  fontFamily: "arial", fontSize: 16, fontWeight: FontWeight.bold,   decoration: TextDecoration.none );
const textStyleIngredientsSmall = TextStyle( color: Colors.grey,  fontFamily: "arial", fontSize: 14, fontWeight: FontWeight.normal, decoration: TextDecoration.none );
const textStylePreparationBig   = TextStyle( color: Colors.black, fontFamily: "arial", fontSize: 16, fontWeight: FontWeight.bold,   decoration: TextDecoration.none );
const textStylePreparationSmall = TextStyle( color: Colors.black, fontFamily: "arial", fontSize: 14, fontWeight: FontWeight.normal, decoration: TextDecoration.none );
const textStyleBase             = TextStyle( color: Colors.black, fontFamily: "arial",               fontWeight: FontWeight.normal, decoration: TextDecoration.none );

/*
final appTheme = ThemeData(
  primaryColor: colorBacground,
  
  textTheme: TextTheme(
    button:        textStyleBase,
    headline1:     textStyleDetailsHead1, 
    headline2:     textStyleDetailsHead2,
    headline3:     textStyleDetailsLine,
    bodyLarge:     textStyleIngredientsBig,
    bodyMedium:    textStylePreparationSmall,
    headlineSmall: textStyleIngredientsSmall,
    labelLarge:    textStylePreparationBig,  
    labelSmall:    textStylePreparationSmall,
    bodySmall:     textStyleBase,            
  ),
);
*/