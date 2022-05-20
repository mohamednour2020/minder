class UserModel {
  UserModel({
      this.data,});

  UserModel.fromJson(dynamic json) {
    data = json['data'] != null ? User.fromJson(json['data']) : null;
  }
  User? data;
UserModel copyWith({  User? data,
}) => UserModel(  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class User {
  User({
      this.id, 
      this.username, 
      this.name, 
      this.age, 
      this.gender, 
      this.subscriptionId,});

  User.fromJson(dynamic json) {
    id = json['id']??0;
    username = json['username']??'';
    name = json['name']??'';
    age = json['age']??'';
    gender = json['gender']??'';
    subscriptionId = json['subscription_id']??0;
  }
  int? id;
  String? username;
  String? name;
  String? age;
  String? gender;
  int? subscriptionId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['name'] = name;
    map['age'] = age;
    map['gender'] = gender;
    map['subscription_id'] = subscriptionId;
    return map;
  }

}