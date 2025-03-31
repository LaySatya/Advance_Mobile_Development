
// TODO

import 'package:week_3_blabla_project/ACTIVITY-3/activity_2_posts_start/model/post.dart';
import 'package:week_3_blabla_project/ACTIVITY-3/activity_2_posts_start/repository/post_repository.dart';

class MockPostRepository implements PostRepository {
  @override
  Future<Post> getPost(int postId) {
    // TODO: implement getPost
    return Future.delayed(Duration(seconds: 3), (){
      if(postId != 25){

      }
    });
    throw UnimplementedError();
  }
  
}