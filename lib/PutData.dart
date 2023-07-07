import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostData extends StatefulWidget {
  const PostData({Key? key});

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  final url = "https://dummy.restapiexample.com/api/v1/create";
  String postResponse = '';

  Future<void> postData() async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {"name": "test", "salary": "123", "age": "23"},
      );

      setState(() {
        postResponse = response.body;
      });
    } catch (e) {
      print('Error occurred while sending post data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("POST"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: postData,
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text("Send Post"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SingleChildScrollView(
                  child: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Post Response:\n',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text: postResponse,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
