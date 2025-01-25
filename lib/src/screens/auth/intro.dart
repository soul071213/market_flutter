import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_flutter/src/screens/auth/login.dart';
import 'package:market_flutter/src/screens/auth/register.dart';

class Intro extends StatefulWidget { //애니메이션을 위해 statefulWidget으로 생성함
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState(){
    super.initState();
    //애니메이션 컨트롤러 초기화
    _animationController = AnimationController(duration: const Duration(seconds: 2),vsync: this);

    //페이드인 애니메이션
    _animation = Tween<double>(begin: 0.0,end: 1.0).animate(_animationController);
    //애니메이션 시작
    _animationController.forward();
  }

  @override
  void dispose(){
    //애니메이션 컨트롤러 해제
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: FadeTransition( //애니메이션 적용
                opacity: _animation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('asset/images/logo.jpg',width: 300,height: 300,),
                    const SizedBox(height: 20,),
                    const Text('당신 근처의 은와네리',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 12,),
                    const Text('동네라서 가능한 모든 것\n지금 내 동네를 선택하고 시작해보세요.',textAlign: TextAlign.center,),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        Get.to(()=>const Register());
                      },
                      child: const Text('시작하기')
                    ),
                    const SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('이미 계정이 있나요?'),
                        TextButton(
                          onPressed: (){
                            Get.to(()=>const Login());
                          },
                          child: const Text('로그인')
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}