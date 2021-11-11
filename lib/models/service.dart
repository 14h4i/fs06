import 'dart:convert';
import 'package:fs06/models/post.dart';
import 'package:fs06/models/public.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<List<Post>?> getPost({Function(String message)? onError}) async {
    var client = http.Client();
    try {
      String path = "/v1/posts";
      Uri uri = Uri.https(api, path, {'tags': "portrait"});
      Map<String, String> header = {
        'Authorization': "Bearer " + userToken,
        "Content-Type": "application/json"
      };
      var response = await client.get(uri, headers: header);
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      if (decodedResponse['code'] != 200) {
        onError!(decodedResponse['code']);
        return [];
      }
      List<dynamic> rawData = decodedResponse['data'];
      List<Post> newPost = rawData.map((e) => Post.formJson(e)).toList();
      return newPost;
    } finally {
      client.close();
    }
  }
}
