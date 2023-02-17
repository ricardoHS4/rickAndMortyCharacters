import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/model/response.dart';

Future<List<Character>> getCaracterListFromAPI() async {
  List<Character> result = [];

  var url = Uri.parse("https://rickandmortyapi.com/api/character");
  http.Response httpResponse = await http.get(url);
  Map<String, dynamic> data = jsonDecode(httpResponse.body);
  Response response = Response.fromJson(data);

  for (int x = 0; x < response.results.length; x++) {
    result.add(Character.fromJson(response.results[x]));
  }

  while (response.info['next'] != null) {
    url = Uri.parse(response.info['next']);
    httpResponse = await http.get(url);
    data = jsonDecode(httpResponse.body);
    response = Response.fromJson(data);
    for (int x = 0; x < response.results.length; x++) {
      result.add(Character.fromJson(response.results[x]));
    }
  }

  return result;
}
