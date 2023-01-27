import 'dart:convert';

import 'package:http/http.dart' as http;

class Episode {
  String name;
  String air_date;

  Episode({
    this.name = "",
    this.air_date = "",
  });

  static Episode fromJson(Map<String, dynamic> json) => Episode(
        name: json['name'] ?? "",
        air_date: json['air_date'] ?? "",
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'air_date': air_date,
      };
}

Future<Episode> getEpisodeFromAPI(String APIurl) async {
  var url = Uri.parse(APIurl);
  http.Response response = await http.get(url);
  Map<String, dynamic> data = jsonDecode(response.body);

  Episode result = Episode.fromJson(data);

  return result;
}
