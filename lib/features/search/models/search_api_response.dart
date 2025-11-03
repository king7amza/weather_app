class SearchApiResponse {
  final List<Weather> weathers;
  SearchApiResponse({required this.weathers});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weathers': weathers.map((x) => x.toMap()).toList(),
    };
  }

  factory SearchApiResponse.fromList(List<dynamic> list) {
    return SearchApiResponse(
      weathers: List<Weather>.from(
        list.map<Weather>((x) => Weather.fromMap(x as Map<String, dynamic>)),
      ),
    );
  }
}

class Weather {
  final String? name;
  final Map<String, String>? localNames;
  final double? lat;
  final double? lon;
  final String? country;
  final String? state;

  Weather({
    this.name,
    this.localNames,
    this.lat,
    this.lon,
    this.country,
    this.state,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'localNames': localNames,
      'lat': lat,
      'lon': lon,
      'country': country,
      'state': state,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      name: map['name'] != null ? map['name'] as String : null,
      localNames: map['local_names'] != null
          ? Map<String, String>.from(map['local_names'] as Map)
          : null,
      lat: map['lat'] != null ? (map['lat'] as num).toDouble() : null,
      lon: map['lon'] != null ? (map['lon'] as num).toDouble() : null,
      country: map['country'] != null ? map['country'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
    );
  }
}
