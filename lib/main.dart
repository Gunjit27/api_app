// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_import

import 'package:api_app/DeleteData.dart';
import 'package:api_app/PostData.dart';
import 'package:flutter/material.dart';
import 'GetData.dart';
import 'package:http/http.dart' as http;

import 'PutData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api App"),
      ),
      body: Center(
        child: Container(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 100, vertical: 200),
          child: Column(
            children: [
              MaterialButton(
                child: Text(
                  'Get',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GetData()));
                },
              ),
              SizedBox(
                height: 40,
              ),
              MaterialButton(
                child: Text(
                  'Post',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PostData()));
                },
              ),
              SizedBox(
                height: 40,
              ),
              MaterialButton(
                child: Text(
                  'Put',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PutData()));
                },
              ),
              SizedBox(
                height: 40,
              ),
              MaterialButton(
                child: Text(
                  'Delete',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DeleteData()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
