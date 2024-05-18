import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  //fromARGB is a alternative CONSTRUCTOR FUNCTION
  seedColor: const Color.fromARGB(255, 0, 115, 255),
);
var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 249, 49, 35),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.secondaryContainer,
          titleTextStyle: const TextStyle(
            fontSize: 16,
          ),
        ),
        //copyWith is a OBJECT FUNCTION
        cardTheme: const CardTheme().copyWith(
          color: const Color.fromARGB(115, 8, 44, 105),
          margin: const EdgeInsets.fromLTRB(13, 4, 13, 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          //styleFrom static method
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.secondaryContainer,
            foregroundColor: kColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 23,
                color: kColorScheme.onPrimary,
              ),
            ),
      ),
      home: const Expenses(),
    ),
  );
}
