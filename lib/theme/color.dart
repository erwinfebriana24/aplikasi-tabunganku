// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

const appRed = Color.fromARGB(255, 190, 30, 30);
const appGreen = Color(0xff5FD068);
const appWhite = Color.fromARGB(255, 255, 255, 255);
const appBlack = Color.fromARGB(255, 5, 5, 5);
const appBlue = Color(0xff243A73);
const appGrey = Color(0xff7F8487);
const appPurple = Color(0xff3D2C8D);
const appGreenSoft = Color.fromARGB(255, 232, 232, 232);


ThemeData dark = ThemeData(
        primaryColor: appWhite,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: appWhite)
        ),
        appBarTheme: AppBarTheme(
          color: appGreen
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: appGreen
          )
        ), 
      );

ThemeData light = ThemeData(
        primaryColor: appBlack,
        brightness: Brightness.light,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: appBlack)
        ),
        appBarTheme: AppBarTheme(
          color: appGreen
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: appGreen
          )
        )
      );