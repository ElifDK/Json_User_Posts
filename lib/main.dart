import 'package:flutter/material.dart';
import 'package:json_user_posts/routes/first_user_page.dart';
import 'package:json_user_posts/routes/post_page.dart';
import 'package:json_user_posts/routes/user_page.dart';
import 'package:json_user_posts/routes/welcome_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => WelcomePage(),
      '/users': (context) => UserPage(title:'User Page'),
      '/posts':(context) => PostPage(),
      '/firstUser': (context) => FirstUserPage(title: 'First User')
    },
  ));
}


