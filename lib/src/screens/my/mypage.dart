import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_flutter/src/screens/my/webpage.dart';
import 'package:market_flutter/src/widgets/listitems/user_mypage.dart';

class Mypage extends StatelessWidget {
  const Mypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserMypage(UserModel(id:1,name:'홍길동')),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Text('나의 거래',style: Theme.of(context).textTheme.labelLarge,),
            ),
            const ListTile(
              title: Text('판매 내역'),
              leading: Icon(Icons.receipt_long_outlined),
            ),
            const ListTile(
              title: Text('로그아웃'),
              leading: Icon(Icons.logout_outlined),
            ),
            const Divider(),
            ListTile(
              title: const Text('이용 약관'),
              onTap: (){
                Get.to(()=>const Webpage('이용약관','/page/terms'));
              },
            ),
            ListTile(
              title: const Text('개인정보 처리방침'),
              onTap: (){
                Get.to(()=>const Webpage('개인정보 처리방침','/page/policy'));
              },
            )
          ],
        ),
      ),
    );
  }
}