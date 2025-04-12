import 'package:flutter/material.dart';
import 'package:json_user_posts/model/post.dart';

class PostCard extends StatelessWidget {

  final Post post;
  final VoidCallback delete;

  const PostCard({required this.post, required this.delete, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(post.text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
              Row(
                children: [
                  Text(post.date,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  Icon(Icons.thumb_up, size: 14, color: Colors.blue,),
                  Text('${post.likes}',
                  ),
                  SizedBox(width: 8,),
                  Icon(Icons.comment, size: 14, color: Colors.blue,),
                  Text(post.comments.toString(),

                  ),
                  IconButton(onPressed: delete, icon: Icon(Icons.delete, size:16, color:Colors.red))
                ],
              )
            ],
          ) )
    );
  }
}
