import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:json_user_posts/model/post.dart';
import 'package:http/http.dart' as http;

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  Map userData = {};
  List<Post>? _posts;

  Future<void> fetchAllUserPostsInList (String userId) async {
    final url = "https://jsonplaceholder.typicode.com/posts?userId=$userId";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (mounted) {
          setState(() {
            _posts = jsonDecode(response.body)
                .map<Post>((e) => Post.fromJson(e))
                .toList();
          });}
        }

    }
    catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    userData = ModalRoute.of(context)!.settings.arguments as Map;

      fetchAllUserPostsInList(userData['id']);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(userData['name']),
        centerTitle: true,
      ),
      body:
      ListView.builder(
          itemCount: _posts?.length ?? 0,
              itemBuilder: (context, index) {
            return Card(
                child: ListTile(
                  title: Text(_posts?[index].title ?? ''),
                  subtitle: Text(_posts?[index].body ?? ''),
                ),
            );
          })
    );
  }
}
