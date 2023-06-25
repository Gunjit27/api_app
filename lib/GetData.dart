import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String stringResponse = "";

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  Future apicall() async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://dummy.restapiexample.com/api/v1/employees"));

    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Container(
          child: Text(stringResponse.toString()),
        ),
      ),
    );
  }
}
