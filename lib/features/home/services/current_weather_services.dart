import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/app_constants.dart';

class GetWeatherUsingCoordServices {
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );
  Dio aDio = Dio();

  Future<bool> _handelLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    return true;
  }

  Future<Response<dynamic>> getCurrentWeather({double? lat, double? lon}) async {
    try {
      await _handelLocationPermission();
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );
      final currentLat = lat ?? position.latitude;
      final currentLon = lon ?? position.longitude;
      aDio.options.baseUrl = AppConstants.baseUrl;
      final Response<dynamic> response = await aDio.get(
        AppConstants.currentCityWeatherEndpoint,
        queryParameters: {"lat": currentLat, "lon": currentLon, "appid": AppConstants.apiKey},
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to get current weather');
      }
    } catch (e) {
      rethrow;
    }
  }
}
