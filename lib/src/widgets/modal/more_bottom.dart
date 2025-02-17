import 'package:flutter/material.dart';
import 'package:market_flutter/src/widgets/modal/confirm_modal.dart';

class MoreBottom extends StatelessWidget {
  final VoidCallback cancelTap;
  final VoidCallback hideTap;
  const MoreBottom({
    required this.hideTap,
    required this.cancelTap,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child:  Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.visibility_off_outlined),
                  title: Text('이 글 숨기기'),
                  onTap: (){
                    showDialog(context: context, builder: (context){
                      return ConfirmModal(title: '글 숨기기',message: '이 글을 숨기시겠습니까? 숨긴 글을 다시 볼 수 없습니다.', confirmText: '숨기기',cancel: () {
                        Navigator.pop(context);
                      },
                      confirmAction: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },);
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help_outlined),
                  title: Text('게시글 노출 기준'),
                ),
                ListTile(
                  leading: Icon(Icons.warning_amber_outlined,color: Colors.red,),
                  title: Text('신고하기'),
                  textColor: Colors.red,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: const Text('닫기',textAlign: TextAlign.center,),
              onTap: cancelTap,
            ),
          )
        ],
      ),
    );
  }
}