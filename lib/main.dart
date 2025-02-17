import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_flutter/src/screens/auth/intro.dart';
import 'package:market_flutter/src/shared/global.dart';
import 'package:market_flutter/src/screens/home.dart';
import 'package:market_flutter/src/screens/intro.dart';
void main() {
  String token = Global.accessToken;
  bool isLogin = token.isNotEmpty; //토큰이 존재하면 로그인 상태로 판단

  runApp(MainApp(isLogin));
}

class MainApp extends StatelessWidget {
  final bool isLogin;
  const MainApp(this.isLogin,{super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute : isLogin ? '/' : '/intro',
      routes:{
        '/' : (context) => const Home(),
        '/intro' : (context)=>const Intro(),
        'register' : (context)=>const RegisterScreen(),
      },
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
    );
  }
}