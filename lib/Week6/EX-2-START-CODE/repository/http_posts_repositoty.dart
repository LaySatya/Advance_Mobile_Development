import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:week_3_blabla_project/Week6/EX-2-START-CODE/repository/post_repository.dart';

import '../model/post.dart';

class HttpPostsRepository extends PostRepository{

  final String _baseUrl = 'https://jsonplaceholder.typicode.com/posts';
  
  @override
  Future<List<Post>> getPosts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        // convert jsson object to post object
        return jsonData.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch posts: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
