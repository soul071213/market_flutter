import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  void updateButtonState(TextEditingController _phoneController){
    String rawText=_phoneController.text;
    String text=rawText.replaceAll('-', ''); // 하이픈 제거

    //사용자가 모든 내용을 삭제하려 할 때 010 만 남깁니다.
    if(text.length<=3&& !rawText.startsWith('010')){
      text='010';
    }else if(text.length>3&&!text.startsWith('010')){
      //입력된 텍스트가 010 으로 시작하지 않으면 010을 자동으로 추가합니다.
      text='010$text';
    }

    //최대 길이를 11자로 제한합니다.
    if(text.length>11){
      text=text.substring(0,11);
    }

    String formattedText = _formatPhoneNumer(text);

    //커서 위치 조정
    int cursorPosition =_phoneController.selection.baseOffset+(formattedText.length-rawText.length);

    //컨트롤러 값 업데이트 부분에서는 직접 phoneController에 접근합니다.
    _phoneController.value=TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(
        offset: cursorPosition>=formattedText.length?formattedText.length:cursorPosition
      ),
    );
  }
  
  String _formatPhoneNumer(String text){
    //하이픈 자동 삽입 로직
    if(text.length>3&& text.length<=7){
      return '${text.substring(0,3)}-${text.substring(3)}';
    } else if(text.length>7){
      return '${text.substring(0,3)}-${text.substring(3,7)}-${text.substring(7)}';
    }
    return text;
  }
  Future<bool> login(String phone,String password) async{
    return true;
  }
  Future<bool> register(String password,String name,int? profile) async{
    return true;
  }
}