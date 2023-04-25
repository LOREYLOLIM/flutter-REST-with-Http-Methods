import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = '';

class BaseClient {
  var client = http.Client();
//GET

  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var _headers = {
      'Authorization': 'Bear sfiesjdcbhsvjhs=',
      'api_key': '',
    };

    var response = await client.get(url, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

// POST REQUEST
  Future<dynamic> post(String api, dynamic object // - added section
      ) async {
    var url = Uri.parse(baseUrl + api);
    // added line for post
    var _payload = json.encode(object);

    var _headers = {
      'Authorization': 'Bear sfiesjdcbhsvjhs=',
      'Content-Type': 'application/json',
      'api_key': '',
    };

    var response = await client.post(
      url,
      headers: _headers,
      body: _payload,
    );
    if (response.statusCode == 201) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

// PUT REQUEST
  Future<dynamic> put(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    // added line for post
    var _payload = json.encode(object);

    var _headers = {
      'Authorization': 'Bear sfiesjdcbhsvjhs=',
      'Content-Type': 'application/json',
      'api_key': '',
    };

    var response = await client.post(
      url,
      headers: _headers,
      body: _payload,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  Future<dynamic> delete(String api) async {
    var url = Uri.parse(baseUrl + api);
    var _headers = {
      'Authorization': 'Bear sfiesjdcbhsvjhs=',
      'api_key': '',
    };

    var response = await client.delete(url, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }
}
