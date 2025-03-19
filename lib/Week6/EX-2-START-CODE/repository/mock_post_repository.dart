import '../model/post.dart';

import 'post_repository.dart';

class MockPostRepository extends PostRepository {
  @override
  Future<List<Post>> getPosts() {
    return Future.delayed(Duration(seconds: 5), () {
     
      return [
        Post(
          id: 25,
          title: 'Who is the best',
          description: 'teacher ronan',
        )
      ];
    });
  }
}
