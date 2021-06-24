import 'dart:convert';
import 'package:flutter_demo/model/profileModel.dart';
import "package:http/http.dart";
import 'package:flutter_demo/model/test.dart';

class Network {
  Future<Album> getProfileDetails() async {
    var url = Uri.parse("https://fakeface.rest/face/json");
    final response = await get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return Album.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error fetching the data");
    }
  }
}
