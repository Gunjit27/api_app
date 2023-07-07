import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteData extends StatefulWidget {
  const DeleteData({Key? key});

  @override
  _DeleteDataState createState() => _DeleteDataState();
}

class _DeleteDataState extends State<DeleteData> {
  String deleteStatus = '';

  Future<void> deleteData() async {
    final url = Uri.parse('https://dummy.restapiexample.com/api/v1/delete/2/');

    try {
      final response = await http.delete(url);

      if (response.statusCode == 200 || response.statusCode == 204) {
        setState(() {
          deleteStatus = 'Data deleted successfully';
        });
      } else if (response.statusCode == 301 || response.statusCode == 302) {
        final redirectUrl = response.headers['location'];
        if (redirectUrl != null) {
          final redirectResponse = await http.delete(Uri.parse(redirectUrl));
          if (redirectResponse.statusCode == 200 ||
              redirectResponse.statusCode == 204) {
            setState(() {
              deleteStatus = 'Data deleted successfully';
            });
          } else {
            setState(() {
              deleteStatus =
                  'Failed to delete data. Status code: ${redirectResponse.statusCode}';
            });
          }
        } else {
          setState(() {
            deleteStatus = 'Failed to delete data. Redirection URL not found.';
          });
        }
      } else {
        setState(() {
          deleteStatus =
              'Failed to delete data. Status code: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        deleteStatus = 'Error occurred while deleting data: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delete Data"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: deleteData,
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                "Delete Data",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Delete Status:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                deleteStatus,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

