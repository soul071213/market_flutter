import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_flutter/src/animation/Feedback.dart';
import 'package:market_flutter/src/models/feed_model.dart';
import 'package:market_flutter/src/screens/controllers/feed_controller.dart';

class FeedEdit extends StatefulWidget {
   final FeedModel item;

  const FeedEdit({super.key,required this.item});

  @override
  State<FeedEdit> createState() => _FeedEditState();
}

class _FeedEditState extends State<FeedEdit> {
 
  bool isPressed =true;
  final FeedController feedController = Get.find<FeedController>();
  TextEditingController? titleController;
  TextEditingController? priceController;

  void _submit(){
    final updateItem=FeedModel.prase({
      'id':widget.item.id,
      'title':titleController!.text,
      'content':widget.item.content,
      'price':int.tryParse(priceController!.text)??widget.item.price,
    });
    feedController.updateData(updateItem);

    Get.back();
  }

  @override
  void initState(){
    super.initState();
    titleController=TextEditingController(text: widget.item.title);
    priceController=TextEditingController(text: widget.item.price.toString());
  }

  @override
  void dispose(){
    titleController?.dispose();
    priceController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('물품 수정'),
      ),
      body: Padding(padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            FeedbackAnimationExample(),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
                )
              ),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
                )
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: _submit, style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states){
                  if(states.contains(WidgetState.pressed))
                    return Colors.blue.shade200;
                  return Colors.blue;
                }
              )
            ), child: AnimatedScale(scale: 
            isPressed?0.95:1.0, duration: Duration(milliseconds: 200),child: Text('수정하기'),)) 
          ],
        ),
      ),
    );
  }
}