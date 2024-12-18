import 'package:bloc_api/pagination/post_model.dart';
import 'package:flutter/material.dart';
class PostListItem extends StatelessWidget {
  const PostListItem({super.key,required this.post});
final Post ? post;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(post!.id.toString(),style:  TextStyle(color:  Colors.teal),),
      title: Text(post!.title.toString(),style:  TextStyle(color:  Colors.red),),
     isThreeLine: true,
      subtitle: Text(post!.body.toString()),
    );
  }
}
