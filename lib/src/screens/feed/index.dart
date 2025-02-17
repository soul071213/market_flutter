import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:market_flutter/src/screens/controllers/feed_controller.dart';
import 'package:market_flutter/src/screens/feed/create.dart';
import 'package:market_flutter/src/widgets/buttons/category_button.dart';
import 'package:market_flutter/src/widgets/listitems/feed_list_item.dart';

class FeedIndex extends StatefulWidget {
  const FeedIndex({super.key});

  @override
  State<FeedIndex> createState() => _FeedIndexState();
}

class _FeedIndexState extends State<FeedIndex> {
  int _currentPage=1;
  final FeedController feedController = Get.put(FeedController());
  @override
  void initState(){
    super.initState();
    feedController.FeedIndex(_currentPage);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        
        onPressed: (){
          Get.to(()=>const FeedCreate());
        },
        tooltip: '항목 추가',
        shape: const CircleBorder(),

        child: const Icon(Icons.add,color: Colors.white,),),
      appBar: AppBar(
        centerTitle: false,
        title: const Text('내 동네'),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none_rounded))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CategoryButton(icon: Icons.menu),
                SizedBox(width: 12,),
                CategoryButton(icon: Icons.search,title: '알바',),
                SizedBox(width: 12,),
                CategoryButton(icon: Icons.home,title:'부동산'),
                SizedBox(width: 12,),
                CategoryButton(icon: Icons.car_crash,title:'중고차'),
                SizedBox(width: 12,),
              ],
            ),
          ),
          Expanded(child: Obx(
            ()=>ListView.builder(
              itemCount: feedController.feedList.length,
              itemBuilder: (context, index) {
                final item=feedController.feedList[index];
                return FeedListItem(item);
              },
            ))
          )
        ],
      ),
    );
  }
}