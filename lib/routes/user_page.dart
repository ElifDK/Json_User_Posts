import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserPage extends StatefulWidget {
  const UserPage({super.key, required this.title});

  final String title;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String _data = 'loading';
  final url = 'https://jsonplaceholder.typicode.com/users';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Column(children: [Expanded(child: Text(_data))]));
  }
}