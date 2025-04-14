import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';

class FirstUserPage extends StatefulWidget {
  const FirstUserPage({super.key, required this.title});

  final String title;

  @override
  State<FirstUserPage> createState() => _FirstUserPageState();
}

class _FirstUserPageState extends State<FirstUserPage> {
  late Future<User> futureUser;

  Future<User> fetchUser() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //fetchAllUsers();
    futureUser = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder<User>(
            future: futureUser,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.name ?? '');
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}


