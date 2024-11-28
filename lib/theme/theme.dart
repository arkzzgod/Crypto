import 'package:flutter/material.dart';

final theme = ThemeData(
    listTileTheme: const ListTileThemeData(
        iconColor: Colors.blue),
    dividerColor: Colors.lightBlueAccent,
    textTheme: const TextTheme(
      labelSmall: TextStyle(
        fontSize: 15,
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
      ),

    ),
    scaffoldBackgroundColor: Colors.white,
    colorSchemeSeed: Colors.green,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      centerTitle: true,
    )
);