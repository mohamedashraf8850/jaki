import 'dart:convert';

import 'Models/ResponseModel.dart';
import 'package:http/http.dart' as http;

import 'config.dart';

/// **********************************post data*************************************************/
Future<ResponseModel> postData(String url, body, context) async {
  var client = http.Client();
  var header = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  try {
    final response = await client.post(baseURL_APP + url,
        body: json.encode(body), headers: header);
    if (response.statusCode == 401) {
      //  throw Exception('Failed to load album');
    } else if (response.statusCode == 503) {
      //  throw Exception('Failed to load album');
    }
    return ResponseModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
  } finally {
    client.close();
  }
}

/// **********************************get data*************************************************/
Future<ResponseModel> getData(String url, context) async {
  var header = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  var client = http.Client();

  try {
    final response = await client.get(
      baseURL_APP + url,
      headers: header,
    );

    if (response.statusCode == 401) {
      //  throw Exception('Failed to load album');

    } else if (response.statusCode == 503) {
      //  throw Exception('Failed to load album');

    }
    return ResponseModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
  } finally {
    client.close();
  }
}
