import 'package:flutter/material.dart';

class Webpage extends StatelessWidget {
  final String title;
  final String url;

  const Webpage(this.title,this.url,{super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Center(child: Text('페이지 로드 : ${Global.baseUrl}$url'),),
    );
  }
}