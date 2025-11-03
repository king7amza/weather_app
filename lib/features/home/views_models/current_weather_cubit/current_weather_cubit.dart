import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/models/current_weather_response_model.dart';
import 'package:weather_app/features/home/services/current_weather_services.dart';
part 'current_weather_state.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  CurrentWeatherCubit() : super(CurrentWeatherInitial());
  final GetWeatherUsingCoordServices currentWeatherServices =
      GetWeatherUsingCoordServices();
  Future<void> getCurrentWeather({double? lat, double? lon}) async {
    emit(CurrentWeatherLoading());
    try {
      final response = await currentWeatherServices.getCurrentWeather(lat: lat, lon: lon);
      final currentWeatherResponse = CurrentWeatherResponseModel.fromMap(
        response.data,
      );
      emit(CurrentWeatherLoaded(currentWeatherResponse));
    } catch (e) {
      emit(CurrentWeatherError(e.toString()));
    }
  }
}
