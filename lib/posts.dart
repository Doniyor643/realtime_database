import 'package:shared_preferences/shared_preferences.dart';

class Post {
  String name;
  String age;
  String city;

  Post(
      this.name,
      this.age,
      this.city,
      );

  Post.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'],
        city = json['city'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'age': age,
    'city': city,
  };
}



class Prefs{

  static Future<bool> saveUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('user_id', userId);
  }

  static Future<String?> loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('user_id');
    return token;
  }

  static Future<bool> removeUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('user_id');
  }

}