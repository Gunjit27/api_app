// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PutData extends StatefulWidget {
  const PutData({super.key});

  @override
  State<PutData> createState() => _PutDataState();
}

class _PutDataState extends State<PutData> {
  final url = "https://dummy.restapiexample.com/api/v1/update/21/";
  
  void PutData() async {
    try{
    final response = await put(
        Uri.parse("https://dummy.restapiexample.com/api/v1/update/21/"),
        body: {"name": "test", "salary": "123", "age": "23"});

    print(response.body);
    }
    catch(er){}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Put"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: ElevatedButton(
          onPressed: PutData,
          child: Text("Put Data"),
        ),
      ),
    );
  }
}
