import 'package:flutter/material.dart';
import 'package:posts/models/post_model.dart';

class DetailPostScreen extends StatelessWidget {
  final PostModel data;
  const DetailPostScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cinta Coding'),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.title,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              SizedBox(height: 6),
              Text('Post by ${data.user}', style: TextStyle(fontSize: 12)),
              SizedBox(height: 6),
              Text(data.body, style: TextStyle(color: Colors.grey),),
              SizedBox(height: 8),
              Divider(thickness: 2,),
              SizedBox(height: 8),
              Text('All Coments'),
              SizedBox(height: 12),
              Divider(thickness: 2,),
              ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: data.comments?.length,
                itemBuilder: (context, index) {
                  final _comment = data.comments![index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_comment.body),
                      SizedBox(width: 6),
                      Text(_comment.email, style: TextStyle(fontWeight: FontWeight.bold)),
                      Divider(thickness: 1,),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
