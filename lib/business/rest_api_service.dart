

import 'dart:convert';
import 'dart:io';
import 'package:test_app/business/text_object.dart';

import 'failure.dart';
import 'package:http/http.dart' as http;
import 'constants_business.dart';

class RestApiService {
  Future<List> getJson() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      http.Response response = await http.get(
          Uri.encodeFull(rest_api_url),
          headers: {"Accept": accepted_format_rest_api});
      return json.decode(response.body);
    } on SocketException {
      throw Failure('No Internet connection');
    } on HttpException {
      throw Failure("Couldn't find the post");
    } on FormatException {
      throw Failure("Bad response format");
    }
  }

  Future<TextObject> postJson(TextObject textObject) async {
    try {
      final http.Response response = await http.post(
        Uri.encodeFull(rest_api_url),
        headers: {"Accept": accepted_format_rest_api},
        body: jsonEncode(textObject));
      if (response.statusCode == 201) {
        return TextObject(jsonDecode(response.body)[0]);
      } else {
        throw Exception('Failed to post json.');
      }
    } on SocketException {
      throw Failure('No Internet connection');
    } on HttpException {
      throw Failure("Couldn't find the post");
    } on FormatException {
      throw Failure("Bad response format");
    }
  }
}

