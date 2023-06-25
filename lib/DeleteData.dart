import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteData extends StatefulWidget {
  const DeleteData({super.key});

  @override
  State<DeleteData> createState() => _DeleteDataState();
}

class _DeleteDataState extends State<DeleteData> {
  void DeleteData() async {
    final url = Uri.parse('https://dummy.restapiexample.com/api/v1/delete/2/');

  try {
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      print('Data deleted successfully');
    } else {
      print('Failed to delete data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error occurred while deleting data: $e');
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Delete Data"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Text("Delete Data"),
        ));
  }
}
