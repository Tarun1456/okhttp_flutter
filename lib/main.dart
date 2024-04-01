import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_okhttp/flutter_okhttp.dart';
import 'package:flutter_okhttp/ok_retry_http_client.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OkHttp Plugin Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _response = '';

  @override
  void initState() {
    super.initState();
    _makeRequest();
  }

  Future<void> _makeRequest() async {
    try {
      // Create an instance of the OkHttp client
      OkHttpClient client = OkHttpClient();

      // Make a GET request to a sample API
      Response response = await client.get('https://jsonplaceholder.typicode.com/posts/1');

      // Set the response data to the state
      setState(() {
        _response = response.body;
      });
    } catch (e) {
      setState(() {
        _response = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OkHttp Plugin Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'HTTP Response:',
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _response,
                    style: TextStyle(fontSize: 16),
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

class OkHttpClient {
  get(String s) {}
}
