import 'package:dio/dio.dart';
import 'package:weather_app/core/app_constants.dart';
import 'package:weather_app/features/search/models/search_api_response.dart';
import 'package:weather_app/features/search/models/search_query.dart';

class SearchServices {
  Dio aDio = Dio();
  Future<SearchApiResponse> searchCity(SearchQuery searchQuery) async {
    aDio.options.baseUrl = AppConstants.baseUrl;
    try {
      final Response<dynamic> response = await aDio.get(
        AppConstants.searchCityEndpoint,
        queryParameters: {
          "q": searchQuery.q,
          "limit": searchQuery.limit,
          "appid": AppConstants.apiKey,
        },
      );
      if(response.statusCode == 200) {
        return SearchApiResponse.fromList(response.data);
      }else{
        throw Exception('Failed to get search weather');
      }
    } catch (e) {
      rethrow;
    }
  }
}
