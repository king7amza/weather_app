import 'dart:convert';

class CurrentWeatherResponseModel {
  final Coord? coord;
  final List<Weather>? weather;
  final String? base;
  final Main? main;
  final int? visibility;
  final Wind? wind;
  final Rain? rain;
  final Clouds? clouds;
  final int? dt;
  final Sys? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  CurrentWeatherResponseModel({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.rain,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coord': coord?.toMap(),
      'weather': weather?.map((x) => x.toMap()).toList(),
      'base': base,
      'main': main?.toMap(),
      'visibility': visibility,
      'wind': wind?.toMap(),
      'rain': rain?.toMap(),
      'clouds': clouds?.toMap(),
      'dt': dt,
      'sys': sys?.toMap(),
      'timezone': timezone,
      'id': id,
      'name': name,
      'cod': cod,
    };
  }

  factory CurrentWeatherResponseModel.fromMap(Map<String, dynamic> map) {
    return CurrentWeatherResponseModel(
      coord: map['coord'] != null
          ? Coord.fromMap(map['coord'] as Map<String, dynamic>)
          : null,
      weather: map['weather'] != null
          ? List<Weather>.from(
              (map['weather'] as List<dynamic>).map<Weather?>(
                (x) => Weather.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      base: map['base'] != null ? map['base'] as String : null,
      main: map['main'] != null
          ? Main.fromMap(map['main'] as Map<String, dynamic>)
          : null,
      visibility: map['visibility'] != null ? map['visibility'] as int : null,
      wind: map['wind'] != null
          ? Wind.fromMap(map['wind'] as Map<String, dynamic>)
          : null,
      rain: map['rain'] != null
          ? Rain.fromMap(map['rain'] as Map<String, dynamic>)
          : null,
      clouds: map['clouds'] != null
          ? Clouds.fromMap(map['clouds'] as Map<String, dynamic>)
          : null,
      dt: map['dt'] != null ? map['dt'] as int : null,
      sys: map['sys'] != null
          ? Sys.fromMap(map['sys'] as Map<String, dynamic>)
          : null,
      timezone: map['timezone'] != null ? map['timezone'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      cod: map['cod'] != null ? map['cod'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentWeatherResponseModel.fromJson(String source) =>
      CurrentWeatherResponseModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}

class Coord {
  final double? lon;
  final double? lat;

  Coord({this.lon, this.lat});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'lon': lon, 'lat': lat};
  }

factory Coord.fromMap(Map<String, dynamic> map) {
  return Coord(
    lon: map['lon'] != null ? (map['lon'] as num).toDouble() : null,
    lat: map['lat'] != null ? (map['lat'] as num).toDouble() : null,
  );
}

  String toJson() => json.encode(toMap());

  factory Coord.fromJson(String source) =>
      Coord.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Weather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['id'] != null ? map['id'] as int : null,
      main: map['main'] != null ? map['main'] as String : null,
      description: map['description'] != null
          ? map['description'] as String
          : null,
      icon: map['icon'] != null ? map['icon'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Main {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;
  final double? seaLevel;
  final double? grndLevel;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'feelsLike': feelsLike,
      'tempMin': tempMin,
      'tempMax': tempMax,
      'pressure': pressure,
      'humidity': humidity,
      'seaLevel': seaLevel,
      'grndLevel': grndLevel,
    };
  }

factory Main.fromMap(Map<String, dynamic> map) {
  return Main(
    temp: map['temp'] != null ? (map['temp'] as num).toDouble() : null,
    feelsLike: map['feelsLike'] != null ? (map['feelsLike'] as num).toDouble() : null,
    tempMin: map['tempMin'] != null ? (map['tempMin'] as num).toDouble() : null,
    tempMax: map['tempMax'] != null ? (map['tempMax'] as num).toDouble() : null,
    pressure: map['pressure'] != null ? map['pressure'] as int : null,
    humidity: map['humidity'] != null ? map['humidity'] as int : null,
    seaLevel: map['seaLevel'] != null ? (map['seaLevel'] as num).toDouble() : null,
    grndLevel: map['grndLevel'] != null ? (map['grndLevel'] as num).toDouble() : null,
  );
}

  String toJson() => json.encode(toMap());

  factory Main.fromJson(String source) =>
      Main.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Wind {
  final double? speed;
  final int? deg;
  final double? gust;

  Wind({this.speed, this.deg, this.gust});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'speed': speed, 'deg': deg, 'gust': gust};
  }

factory Wind.fromMap(Map<String, dynamic> map) {
  return Wind(
    speed: map['speed'] != null ? (map['speed'] as num).toDouble() : null,
    deg: map['deg'] != null ? map['deg'] as int : null,
    gust: map['gust'] != null ? (map['gust'] as num).toDouble() : null,
  );
}

  String toJson() => json.encode(toMap());

  factory Wind.fromJson(String source) =>
      Wind.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Rain {
  final double? the1h;

  Rain({this.the1h});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'the1h': the1h};
  }

factory Rain.fromMap(Map<String, dynamic> map) {
  return Rain(the1h: map['the1h'] != null ? (map['the1h'] as num).toDouble() : null);
}

  String toJson() => json.encode(toMap());

  factory Rain.fromJson(String source) =>
      Rain.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Clouds {
  final int? all;

  Clouds({this.all});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'all': all};
  }

  factory Clouds.fromMap(Map<String, dynamic> map) {
    return Clouds(all: map['all'] != null ? map['all'] as int : null);
  }

  String toJson() => json.encode(toMap());

  factory Clouds.fromJson(String source) =>
      Clouds.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Sys {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'id': id,
      'country': country,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  factory Sys.fromMap(Map<String, dynamic> map) {
    return Sys(
      type: map['type'] != null ? map['type'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      country: map['country'] != null ? map['country'] as String : null,
      sunrise: map['sunrise'] != null ? map['sunrise'] as int : null,
      sunset: map['sunset'] != null ? map['sunset'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sys.fromJson(String source) =>
      Sys.fromMap(json.decode(source) as Map<String, dynamic>);
}
