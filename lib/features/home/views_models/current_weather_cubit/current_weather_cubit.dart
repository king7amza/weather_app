import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/models/current_weather_response_model.dart';
import 'package:weather_app/features/home/services/current_weather_services.dart';
part 'current_weather_state.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  CurrentWeatherCubit() : super(CurrentWeatherInitial());
  final CurrentWeatherServices currentWeatherServices =
      CurrentWeatherServices();
  Future<void> getCurrentWeather() async {
    emit(CurrentWeatherLoading());
    try {
      final response = await currentWeatherServices.getCurrentWeather();
      final currentWeatherResponse = CurrentWeatherResponseModel.fromMap(
        response.data,
      );
      emit(CurrentWeatherLoaded(currentWeatherResponse));
    } catch (e) {
      emit(CurrentWeatherError(e.toString()));
    }
  }
}
