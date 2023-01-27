import 'dart:convert';

import 'package:http/http.dart' as http;

class Character {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  String image;
  Map<String,dynamic> origin;
  Map<String,dynamic> location;
  List<dynamic> episode;

  Character({
    this.id = -1,
    this.name = "",
    this.status = "unknown",
    this.species = "",
    this.type = "",
    this.gender = "",
    this.image = "",
    this.origin = const {},
    this.location = const {},
    this.episode = const [],
  });

  static Character fromJson(Map<String, dynamic> json) => Character(
        id: json['id'] ?? -1,
        name: json['name'] ?? "",
        status: json['status'] ?? "unknown",
        species: json['species'] ?? "",
        type: json['type'] ?? "",
        gender: json['gender'] ?? "",
        image: json['image'] ?? "",
        origin: json['origin'] ?? {},
        location: json['location'] ?? {},
        episode: json['episode'] ?? [],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'status': status,
        'species': species,
        'type': type,
        'gender': gender,
        'image': image,
        'origin': origin,
        'location': location,
        'episode': episode,
      };
}

Future<List<Character>> getCaracterListFromAPI() async {
  List<Character> result = [];

  var url = Uri.parse("https://rickandmortyapi.com/api/character");
  http.Response response = await http.get(url);
  Map<String, dynamic> data = jsonDecode(response.body);
  dynamic charactersList = data['results']; 

  print(charactersList[0]['image']);

  for(int x=0;x<charactersList.length;x++){
    result.add(Character.fromJson(charactersList[x]));
  }

  return result;
}
