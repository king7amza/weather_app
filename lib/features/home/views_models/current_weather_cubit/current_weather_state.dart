part of 'current_weather_cubit.dart';

sealed class CurrentWeatherState {}

final class CurrentWeatherInitial extends CurrentWeatherState {}

final class CurrentWeatherLoading extends CurrentWeatherState {}

final class CurrentWeatherLoaded extends CurrentWeatherState {
  final CurrentWeatherResponseModel currentWeatherResponse;
  CurrentWeatherLoaded(this.currentWeatherResponse);
}

final class CurrentWeatherError extends CurrentWeatherState {
  final String message;
  CurrentWeatherError(this.message);
}
