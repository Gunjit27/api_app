import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PutData extends StatefulWidget {
  const PutData({Key? key});

  @override
  State<PutData> createState() => _PutDataState();
}

class _PutDataState extends State<PutData> {
  final url = "https://dummy.restapiexample.com/api/v1/update/21/";
  String putResponse = '';

  Future<void> putData() async {
    try {
      final response = await http.put(
        Uri.parse(url),
        body: {"name": "test", "salary": "123", "age": "23"},
      );

      setState(() {
        putResponse = response.body;
      });
    } catch (e) {
      print('Error occurred while updating data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PUT"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: putData,
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text("Put Data"),
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
                          text: 'Put Response:\n',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text: putResponse,
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
