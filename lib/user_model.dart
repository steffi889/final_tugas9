import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String id;
  String name;
  String job;
  String created;


  User({this.id, this.name, this.job, this.created});

  factory User.createUser(Map<String, dynamic> object) {
    return User(
        id: object['_id'].toString(),
        name: object['name'],
        job: object['job'],
        created: object['createdAt']
        );
  }

  static Future<User> connectToAPI(String id) async {
    String apiURL = "https://thawing-stream-50060.herokuapp.com/api/users/" + id;
    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    return User.createUser(jsonObject);
  }
}
