// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostData extends StatefulWidget {
  const PostData({super.key});

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  final url = "https://dummy.restapiexample.com/api/v1/create";
  
  void PostData() async {
    try{
    final response = await post(
        Uri.parse("https://dummy.restapiexample.com/api/v1/create"),
        body: {"name": "test", "salary": "123", "age": "23"});

    print(response.body);
    }
    catch(er){}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: ElevatedButton(
          onPressed: PostData,
          child: Text("Send Post"),
        ),
      ),
    );
  }
}
