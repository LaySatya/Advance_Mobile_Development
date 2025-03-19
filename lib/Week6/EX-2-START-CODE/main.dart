import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/Week6/EX-2-START-CODE/repository/http_posts_repositoty.dart';
import 'repository/post_repository.dart';
import 'package:provider/provider.dart';

import 'ui/providers/post_provider.dart';
import 'ui/screens/post_screen.dart';

void main() {
  // 1- Create the repository
  PostRepository postRepo = HttpPostsRepository();

  // 2 - Run the UI
  runApp(
    ChangeNotifierProvider(
      create: (context) => PostsProvider(repository: postRepo),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: PostsScreen()),
    ),
  );
}
