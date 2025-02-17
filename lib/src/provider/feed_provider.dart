import 'package:get/get.dart';
import 'package:market_flutter/src/shared/global.dart';
import 'provider.dart';

class FeedProvider extends Provider{
  // Future<Map> index({int page=1}) async {
  //   final response = await get(
  //     'api/feed',
  //     query: {'page':'$page'},
  //     headers: {'Authorization':'Bearer ${Global.accessToken}'},
  //   );

    // Response response=await get('/api/feed',query: {'page':'$page'});
  Future<Map> store(String title,String price,String content,int? image) async{
    final Map<String,dynamic> body={
      'title':title,
      'price':price,
      'content':content,
    };

    if(image != null){
      body['imageID']=image.toString();
    }

    final response =await post('/api/feed',body);
    return response.body;
  }
}