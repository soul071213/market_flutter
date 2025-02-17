import 'dart:math'; // 랜덤 숫자 생성을 위한 Dart의 math 라이브러리
import 'package:get/get.dart'; // GetX 상태 관리 및 의존성 주입을 위한 라이브러리
import 'package:market_flutter/src/models/feed_model.dart'; // FeedModel 클래스 import
import 'package:market_flutter/src/provider/feed_provider.dart'; // FeedProvider 클래스 import
import 'package:market_flutter/src/screens/feed/index.dart'; // FeedIndex 화면 import

class FeedController extends GetxController {
  // FeedProvider 인스턴스를 생성하고 GetX에 등록
  final feedprovider = Get.put(FeedProvider());

  // 관찰 가능한(observable) FeedModel 리스트. GetX의 RxList를 사용하여 상태 관리
  RxList<FeedModel> feedList = <FeedModel>[].obs;

  // 페이지 번호를 받아 피드 데이터를 가져오는 비동기 함수
  FeedIndex(int page) async {
    // FeedProvider를 통해 페이지에 해당하는 피드 데이터를 가져옴
    Map json = await feedprovider.getList(page: page);

    // JSON 데이터를 FeedModel 객체로 변환하여 임시 리스트에 저장
    List<FeedModel> tmp = json['data'].map((m) => FeedModel.prase(m)).toList();

    // 페이지가 1이면 기존 리스트를 초기화하고, 그렇지 않으면 기존 리스트에 추가
    (page == 1) ? feedList.assignAll(tmp) : feedList.addAll(tmp);
  }

  // 새로운 피드 데이터를 랜덤으로 생성하여 리스트에 추가하는 함수
  void addData() {
    final random = Random(); // 랜덤 숫자 생성기

    // 새로운 FeedModel 객체를 생성
    final newItem = FeedModel.prase({
      'id': random.nextInt(100), // 0부터 99 사이의 랜덤 ID
      'title': '제목 ${random.nextInt(100)}', // 랜덤 제목
      'content': '설명 ${random.nextInt(100)}', // 랜덤 내용
      'price': 500 + random.nextInt(49500), // 500부터 50000 사이의 랜덤 가격
    });

    // 생성된 새로운 아이템을 feedList에 추가
    feedList.add(newItem);
  }

  // 기존 피드 데이터를 업데이트하는 함수
  void updateData(FeedModel updatedItem) {
    // 업데이트할 아이템의 인덱스를 찾음
    final index = feedList.indexWhere((item) => item.id == updatedItem.id);

    // 아이템이 존재하면 업데이트
    if (index != -1) {
      feedList[index] = updatedItem;
    }
  }
}


// ...widget.item은 Dart의 스프레드 연산자(spread operator)를 사용한 것입니다. 이 연산자는 Map이나 List와 같은 컬렉션의 모든 요소를 다른 컬렉션에 "펼쳐서" 추가하는 역할을 합니다. 여기서 widget.item은 현재 위젯에 전달된 Map 데이터라고 가정할 수 있습니다.
// void _submit() {
//   final item = {
//     ...widget.item, // 기존의 widget.item 데이터를 모두 복사
//     'title': titleController!.text, // title을 업데이트
//     'price': int.tryParse(priceController!.text) ?? widget.item['price'] // price를 업데이트
//   };
//   feedController.updateData(item); // 업데이트된 데이터를 컨트롤러에 전달
//   Get.back(); // 현재 화면을 닫고 이전 화면으로 돌아감
// }