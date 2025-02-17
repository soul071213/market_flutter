import 'package:flutter/material.dart';

class CurvedScreen extends StatefulWidget {
  const CurvedScreen({super.key});

  @override
  State<CurvedScreen> createState() => _CurvedScreenState();
}

class _CurvedScreenState extends State<CurvedScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState(){
    super.initState();
    _controller=AnimationController(vsync: this,duration: const Duration(seconds: 2))
    ..repeat(reverse: true);
    // /Curves.easeIn 곡선을 적용하여 시작할 때는 천천히 점점 빠르게 투명해지게 효과를 만듬
    _animation=CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        //FadeTransition을 사용하여 용기의 투명도를 애니메이션화함
        child: FadeTransition(opacity: _animation,child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        ),),
      ),
    );
  }
}