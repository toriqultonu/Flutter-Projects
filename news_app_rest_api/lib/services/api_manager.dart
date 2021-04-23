import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_rest_api/constants/strings.dart';

class Api_Manager {
  void getNews() async {
    var client = http.Client();
    var response = await client.get(Strings.news_url);
    if(response.statusCode == 200){
      var jsonString = response.body;
      var jsonMap = json.decoder(jsonString);
    }
  }
}