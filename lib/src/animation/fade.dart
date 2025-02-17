import 'package:flutter/material.dart';

class FaedIn extends StatefulWidget {
  const FaedIn({super.key});

  @override
  State<FaedIn> createState() => _FaedInState();
}

class _FaedInState extends State<FaedIn> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animantion;

  @override
  void initState(){
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animantion = Tween(begin: 0.0, end: 1.0).animate(controller) //Tween은 시작과 끝의 상태를 정의
      ..addListener((){
        setState(() {
          
        });
      }
    );
    controller.forward(); //시작
  }
  
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Opacity(opacity: animantion.value, //투명도를 0부터 1까지
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
          child: Text('Fade In',style: TextStyle(color: Colors.white,fontSize: 24),),
        ),),
      ),
    );
  }
}