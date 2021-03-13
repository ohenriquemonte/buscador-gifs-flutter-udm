import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int offset = 0;

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search == null)
      response = await http.get(
          'https://api.giphy.com/v1/gifs/trending?api_key=P99SSpITIcvb3S2jrTGmJoeydLbF6ZPy&limit=20rating=G');
    else
      response = await http.get(
          'https://api.giphy.com/v1/gifs/trending?api_key=P99SSpITIcvb3S2jrTGmJoeydLbF6ZPy&q=$_search&limit=20&offset=$offset&rating=G&lang=en');

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    _getGifs().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
