import 'dart:convert';
import 'package:http/http.dart' as http;

class PostResult {
  String id;
  String name;
  String job;

  PostResult({this.id, this.name, this.job});

  factory PostResult.createpostresult(Map<String, dynamic> object)
  {
    return PostResult(
      id: object['id'],
      name: object['name'],
      job: object['job']);
  }

  static Future<PostResult> connectToAPI(String name, String job) async
{
    String apiURL = "https://thawing-stream-50060.herokuapp.com/api/users";
   var apiResult =  await http.post(apiURL, body: {"name" : name, "job" : job});
   var jsonObject = json.decode(apiResult.body);

    return PostResult.createpostresult(jsonObject);
  }
}
