import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_flutter/src/screens/auth/intro.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffFF7E36),
            padding: const EdgeInsets.symmetric(vertical: 22),
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xffFF7E36),
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(fontSize: 16,color: Colors.grey),
          floatingLabelStyle: TextStyle(fontSize: 10),
          contentPadding: EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color:Colors.grey),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)
          )
        ),
        textTheme: const TextTheme(
          labelLarge: TextStyle(
            fontSize: 16,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.bold
          )
        )
      ),
      home: const Intro(),
    );
  }
}