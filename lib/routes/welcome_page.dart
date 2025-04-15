import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  OutlinedButton(onPressed: () {Navigator.pushNamed(context, '/users');},
                  child: Text('Users'),),
                  SizedBox(width: 50,),
                  OutlinedButton(onPressed: () {Navigator.pushNamed(context, '/firstUser');},
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('First User'),
                    ),)
                ],
              ),
            ],
          ),
        )
    );;
  }
}
