import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/search/models/search_api_response.dart';
import 'package:weather_app/features/search/models/search_query.dart';
import 'package:weather_app/features/search/services/search_services.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final searchServices = SearchServices();
  Future<void> searchCity(String q) async {
    emit(SearchLoading());
    try {
      final searchApiResponse = await searchServices.searchCity(
        SearchQuery(q: q),
      );
      emit(SearchLoaded(searchApiResponse));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
