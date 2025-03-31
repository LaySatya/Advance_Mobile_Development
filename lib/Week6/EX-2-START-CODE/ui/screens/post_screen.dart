import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_3_blabla_project/Week6/EX-2-START-CODE/ui/providers/async_value.dart';

import '../../model/post.dart';
import '../../ui/providers/post_provider.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final postsProvider = Provider.of<PostsProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          IconButton(
            onPressed: () =>  postsProvider.fetchPosts(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(child: _buildPostsBody(postsProvider)),
    );
  }

  Widget _buildPostsBody(PostsProvider postsProvider) {
    final postValue = postsProvider.postValue;

    if (postValue == null) {
      return const Text('Tap refresh to load posts');
    }

    switch (postValue.state) {
      case AsyncValueState.loading:
        return const CircularProgressIndicator();
      case AsyncValueState.error:
        return Text('Error: ${postValue.error}');
      case AsyncValueState.success:
        final posts = postValue.data!;
        return posts.isEmpty
            ? const Text('No posts available')
            : PostsList(posts: posts);
    }
  }
}

class PostsList extends StatelessWidget {
  final List<Post> posts;

  const PostsList({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostCard(post: posts[index]);
      },
    );
  }
}

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.title),
      subtitle: Text(post.description),
    );
  }
}