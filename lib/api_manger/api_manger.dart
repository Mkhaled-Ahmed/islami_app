import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami/models/radio/radio_model.dart';


class ApiManger {

  static Future<List<Radios>>getAllRadio() async {
    http.Response response = await http
        .get(Uri.parse("https://mp3quran.net/api/v3/radios?language=ar"));
    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      RadioModel data = RadioModel.fromJson(json);
      return data.radios??[];
    }
    else{
      throw "Error";
    }
  }
}
