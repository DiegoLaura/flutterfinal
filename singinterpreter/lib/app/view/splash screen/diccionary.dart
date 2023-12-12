import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DictionaryScreen extends StatefulWidget {
  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  List<dynamic> dictionaries = [];

  Future<void> fetchDictionaries() async {
    try {
      final response = await http
          .get(Uri.parse('http://ip172-18-0-27-clro1defml8g009ceh50-8000.direct.labs.play-with-docker.com/api/diccionarios/'));
      if (response.statusCode == 200) {
        setState(() {
          dictionaries = jsonDecode(response.body);
        });
      } else {
        print('Failed to fetch dictionaries');
      }
    } catch (e) {
      print('Error fetching dictionaries: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dictionary'),
      ),
      body: ListView.builder(
        itemCount: dictionaries.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              for (int i = 0; i < 3; i++)
                if (index * 3 + i < dictionaries.length)
                  Expanded(
                    child: Card(
                      child: Column(
                        children: [
                          Image.network(
                            dictionaries[index * 3 + i]['imagen'],
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                          Text(dictionaries[index * 3 + i]['descripcion']),
                        ],
                      ),
                    ),
                  ),
            ],
          );
        },
      ),
    );
  }
}
