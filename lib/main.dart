import 'package:flutter/material.dart';
import 'package:json_user_posts/routes/first_user_page.dart';
import 'package:json_user_posts/routes/user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Json Serialization Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FirstUserPage(title: 'User Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

