import 'package:flutter/material.dart';
import 'package:ui/view/expenses.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //var kColorScheme = ColorScheme.fromSeed(
  //seedColor: const Color.fromARGB(255, 96, 59, 181),

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData().copyWith(
      //     useMaterial3: true,
      //     colorScheme: kColorScheme,
      //     appBarTheme: const AppBarTheme().copyWith(
      //         backgroundColor: kColorScheme.onTertiaryContainer,
      //         foregroundColor: kColorScheme.primaryContainer)),
      home: Expenses(),
    );
  }
}
