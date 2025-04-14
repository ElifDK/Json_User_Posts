import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_user_posts/model/user.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key, required this.title});

  final String title;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List <User>? _users;
  String _data = 'loading';
  final url = 'https://jsonplaceholder.typicode.com/user';

  Future<void> fetchAllUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      setState(() {
        if (response.statusCode >= 200 && response.statusCode < 300) {
          _data = response.body;
        } else {
          _data = response.statusCode.toString();
        }
      });
    } catch (err) {
      print(err);
    }
  }

  Future<void> fetchAllUsersInList () async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        setState(() {
          _users = jsonDecode(response.body)
              .map<User>((e) => User.fromJson(e))
              .toList();
        });
      }
    }
    catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //fetchAllUsers();
    fetchAllUsersInList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount : _users?.length ?? 0,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: (){},
                  title: Text(_users?[index].id.toString() ?? ''),
                  subtitle: Text(_users?[index].name ?? ''),
                ),
              );
            })
    );
  }
}