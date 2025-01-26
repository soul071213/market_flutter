import 'dart:async'; // 비동기 작업을 위한 타이머 및 Future를 사용하기 위해 import
import 'package:flutter/material.dart'; // Flutter 위젯 및 Material 디자인 사용
import 'package:get/get.dart';
import 'package:market_flutter/src/provider/auth_provider.dart'; // GetX 패키지 사용

class AuthController extends GetxController {
  // AuthProvider를 의존성으로 주입 (인증 관련 API 호출을 담당)
  final authProvider = Get.put(AuthProvider());

  // 상태 관리를 위한 반응형 변수들
  final RxBool isButtonEnabled = false.obs; // 버튼 활성화 상태
  final RxBool showVerifyForm = false.obs; // 인증 폼 표시 여부
  final RxString buttonText = "인증 문자 받기".obs; // 버튼 텍스트
  String? phoneNumber; // 인증 요청한 휴대폰 번호 저장
  Timer? countdownTimer; // 타이머 (인증 코드 유효 시간 카운트다운)

  // 휴대폰 인증 코드 요청 함수
  Future<void> requestVerificationCode(String phone) async {
    // AuthProvider를 통해 인증 코드 요청 API 호출
    Map body = await authProvider.requestPhoneCode(phone);

    // API 응답이 성공적일 경우
    if (body['result'] == 'ok') {
      phoneNumber = phone; // 인증 요청한 휴대폰 번호 저장
      DateTime expiryTime = DateTime.parse(body['expired']); // 인증 코드 만료 시간 파싱
      _startCountdown(expiryTime); // 카운트다운 시작
    }
  }

  // 사용자가 입력한 인증 코드 검증 함수
  Future<bool> verifyPhoneNumber(String userInputCode) async {
    // AuthProvider를 통해 인증 코드 검증 API 호출
    Map body = await authProvider.verifyPhoneNumber(userInputCode);

    // API 응답이 성공적일 경우
    if (body['result'] == 'ok') {
      return true; // 인증 성공
    }

    // 인증 실패 시 스낵바로 에러 메시지 표시
    Get.snackbar('인증 번호 에러', body['message'], snackPosition: SnackPosition.BOTTOM);
    return false; // 인증 실패
  }

  // 카운트다운 시작 함수
  void _startCountdown(DateTime expiryTime) {
    isButtonEnabled.value = false; // 버튼 비활성화
    showVerifyForm.value = true; // 인증 폼 표시
    countdownTimer?.cancel(); // 기존 타이머가 있다면 취소

    // 1초마다 타이머 실행
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      Duration timeDiff = expiryTime.difference(DateTime.now()); // 남은 시간 계산

      // 남은 시간이 0 이하일 경우
      if (timeDiff.isNegative) {
        buttonText.value = "인증 문자 다시 받기"; // 버튼 텍스트 변경
        isButtonEnabled.value = true; // 버튼 활성화
        timer.cancel(); // 타이머 종료
      } else {
        // 남은 시간을 mm:ss 포맷으로 표시
        String minutes = timeDiff.inMinutes.toString().padLeft(2, '0');
        String seconds = (timeDiff.inSeconds % 60).toString().padLeft(2, '0');
        buttonText.value = "인증문자 다시 받기 $minutes:$seconds";
      }
    });
  }

  // 휴대폰 번호 입력 시 버튼 상태 업데이트 함수
  void updateButtonState(TextEditingController _phoneController) {
    String rawText = _phoneController.text; // 입력된 텍스트
    String text = rawText.replaceAll('-', ''); // 하이픈 제거

    // 사용자가 모든 내용을 삭제하려 할 때 '010'만 남김
    if (text.length <= 3 && !rawText.startsWith('010')) {
      text = '010';
    } else if (text.length > 3 && !text.startsWith('010')) {
      // 입력된 텍스트가 '010'으로 시작하지 않으면 '010'을 자동으로 추가
      text = '010$text';
    }

    // 최대 길이를 11자로 제한
    if (text.length > 11) {
      text = text.substring(0, 11);
    }

    // 하이픈을 포함한 포맷팅된 휴대폰 번호 생성
    String formattedText = _formatPhoneNumer(text);

    // 커서 위치 조정
    int cursorPosition = _phoneController.selection.baseOffset + (formattedText.length - rawText.length);

    // TextEditingController 값 업데이트
    _phoneController.value = TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(
        offset: cursorPosition >= formattedText.length ? formattedText.length : cursorPosition,
      ),
    );

    // 휴대폰 번호가 11자리일 때만 버튼 활성화
    isButtonEnabled.value = text.length == 11;
  }

  // 휴대폰 번호 포맷팅 함수 (하이픈 자동 삽입)
  String _formatPhoneNumer(String text) {
    if (text.length > 3 && text.length <= 7) {
      return '${text.substring(0, 3)}-${text.substring(3)}';
    } else if (text.length > 7) {
      return '${text.substring(0, 3)}-${text.substring(3, 7)}-${text.substring(7)}';
    }
    return text;
  }

  // 로그인 함수 (예시로 항상 true 반환)
  Future<bool> login(String phone, String password) async {
    return true;
  }

  // 회원가입 함수 (예시로 항상 true 반환)
  Future<bool> register(String password, String name, int? profile) async {
    Map body=await authProvider.register(phoneNumber!,password,name,profile);
    if(body['result']=='ok'){
      return true;
    }
    Get.snackbar('회원가입에러', body['message'],snackPosition: SnackPosition.BOTTOM);
    return false;
  }
}