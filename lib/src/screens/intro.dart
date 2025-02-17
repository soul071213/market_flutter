import 'package:flutter/material.dart';
// import 'package:sellshop/src/screens/feed/show.dart';
// import 'package:sellshop/src/screens/shared/data.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('이 책은 플러토로 \n 중고 거래 애플리케이션을 만듭니다.',textAlign: TextAlign.center,),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context,'/feed/1');
              // Navigator.push(context,MaterialPageRoute(builder: (context)=>FeedShow(FeedList[0])));
            },child: Text('사용하러 가기'),),
          ]
        ),
      ),
    );
  }
}