
class Response {
  Map<String,dynamic> info;
  List<dynamic> results;

  Response({
    this.info = const {},
    this.results = const [],
  });

  static Response fromJson(Map<String, dynamic> json) => Response(
        info: json['info'] ?? {},
        results: json['results'] ?? [],
      );

  Map<String, dynamic> toJson() => {
        'info': info,
        'results': results,
      };
}


