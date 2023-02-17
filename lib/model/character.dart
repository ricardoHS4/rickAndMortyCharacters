
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


