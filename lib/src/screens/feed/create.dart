import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_flutter/src/screens/controllers/feed_controller.dart';
import 'package:market_flutter/src/widgets/forms/label_textfield.dart';

class FeedCreate extends StatefulWidget {
  const FeedCreate({super.key});

  @override
  State<FeedCreate> createState() => _FeedCreateState();
}

class _FeedCreateState extends State<FeedCreate> {
  final feedController = Get.put(FeedController);
  int? imageId;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  _submit() async{
    final result = await feedController.feedCreate(
      _titleController.text,
      _priceController.text,
      _contentController.text,
      imageId
    );
    if(result){
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('내 물건 팔기'),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(child: ListView(
              children: [
                //이미지 업로드
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey,width: 1)
                      ),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16,),
                LabelTextfield(label: '제목', hintText: '제목', controller: _titleController),
                LabelTextfield(label: '갸격', hintText: '가격을 입력해주세요', controller: _priceController),
                LabelTextfield(label: '자세한 설명', hintText: '자세한 설명을 입력하세요', controller: _contentController,maxLines: 6,),
              ],
            )),
            Padding(padding: const EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(onPressed: _submit, child: const Text('작성 완료')),
            )
          ],
        ),
      ),
    );
  }
}