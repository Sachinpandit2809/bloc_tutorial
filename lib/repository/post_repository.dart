import "dart:convert";
import "dart:io";

import "package:bloc_tutorial/model/post_model.dart";
import "package:http/http.dart" as http;

class PostRepository {
  Future<List<PostModel>> fetchPostApi() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;

        return body.map((e)=> PostModel.fromJson(e) ).toList();
        // return body.map((e) {
        //   return PostModel(
        //       body: e['body'],
        //       id: e['id'],
        //       title: e['title'],
        //       userId: e['userId']);
        // }).toList();
      }
    } on SocketException {
      throw Exception(" No internet connection ");
    }
    throw Exception(" error while fetching Postdata");
  }
}
