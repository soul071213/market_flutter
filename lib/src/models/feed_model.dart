class FeedModel {
  late int id;
  late String title;
  late String content;
  late int price;

  FeedModel.prase(Map m){
    id=m['id'];
    title=m['title'];
    content=m['content'];
    price=m['price'];
  }
}