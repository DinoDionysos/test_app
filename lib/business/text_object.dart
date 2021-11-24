
import 'dart:convert';
import 'package:http/http.dart' as http;

class TextObject {
  String? userId;
  String? id;
  String? title;
  String? body;

  TextObject(Map<String, dynamic> json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }

  void fromJson(Map<String, dynamic> json){
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }

  Map<String, dynamic> toJson() {
    return <String, String?>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}

class TextObjectList {
  List<TextObject> list = <TextObject>[];

  TextObjectList(http.Response response){
    List jsonDynamic = json.decode(response.body);
    for (int i = 0; i < jsonDynamic.length; i++) {
      TextObject textObject = TextObject(jsonDynamic[i]);
      list.add(textObject);
    }
  }

  void fromJson(http.Response response){
    List jsonDynamic = json.decode(response.body);
    for (int i = 0; i < jsonDynamic.length; i++) {
      TextObject textObject = TextObject(jsonDynamic[i]);
      list.add(textObject);
    }
  }
}



