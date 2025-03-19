import 'package:flutter/material.dart';

import '../../model/post.dart';
import '../../repository/post_repository.dart';
import 'async_value.dart';

class PostsProvider extends ChangeNotifier {
  final PostRepository _repository;

  AsyncValue<List<Post>>? postValue;

  PostsProvider({required PostRepository repository}) : _repository = repository;

  void fetchPosts() async {
    // 1-  Set loading state
    postValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2   Fetch the data
      List<Post> post = await _repository.getPosts();

      // 3  Set success state
      postValue = AsyncValue.success(post);
    } catch (error) {
      // 4  Set error state
      postValue = AsyncValue.error(error);
    }

    notifyListeners();
  }
}
