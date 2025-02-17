class UserModel {
  late int id;
  late String name;
  late String profileUrl;
  int? profile;

  UserModel({required this.id,required this.name});

  UserModel.prase(Map m){
    id=m['id'];
    name=m['name'];
    profile=m['profile_id'];
  }


}