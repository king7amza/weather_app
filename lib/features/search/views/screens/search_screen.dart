import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/themes/app_colors.dart';
import 'package:weather_app/features/common/common_screens/common_shimmer_eff.dart';
import 'package:weather_app/features/home/views_models/current_weather_cubit/current_weather_cubit.dart';
import 'package:weather_app/features/search/view_models/search_cubit/search_cubit.dart';
import 'package:weather_app/features/search/views/widgets/weather_horizontal_item.dart';
import 'package:weather_app/features/search/views/widgets/weather_item_details.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);
    return SafeArea(
      child: BlocBuilder<SearchCubit, SearchState>(
        bloc: searchCubit,
        builder: (context, state) {
          if (state is SearchLoading) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      hintText: 'Search City',
                      hintStyle: const TextStyle(color: AppColors.grey),
                      label: const Text('Search City'),
                      labelStyle: const TextStyle(color: AppColors.grey),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.grey,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(child: const Center(child: CommonShimmerEff())),
                ],
              ),
            );
          } else if (state is SearchLoaded) {
            final weathers = state.searchApiResponse.weathers;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      hintText: 'Search City',
                      hintStyle: const TextStyle(color: AppColors.grey),
                      label: const Text('Search City'),
                      labelStyle: const TextStyle(color: AppColors.grey),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                          child: IconButton(
                            onPressed: () {
                              searchController.text.isEmpty ||
                                      searchController.text == ''
                                  ? null
                                  : searchCubit.searchCity(
                                      searchController.text,
                                    );
                            },
                            icon: const Icon(
                              Icons.search,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  weathers.isEmpty
                      ? Padding(
                        padding: const EdgeInsets.only(top:50.0),
                        child: Column(
                            children: [
                              Text(
                                "No City Found",
                                style: Theme.of(context).textTheme.headlineLarge!
                                    .copyWith(color: AppColors.white),
                              ),
                              const SizedBox(height: 20),
                              Image.asset(
                                'assets/images/wow_such_empty.png',
                                width: 300,
                                height: 300,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                      )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: weathers.length,
                            itemBuilder: (context, index) {
                              final cityWeather = weathers[index];
                              return BlocProvider(
                                create: (context) {
                                  final currentWeatherCubit =
                                      CurrentWeatherCubit();
                                  currentWeatherCubit.getCurrentWeather(
                                    lat: cityWeather.lat,
                                    lon: cityWeather.lon,
                                  );
                                  return currentWeatherCubit;
                                },
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            WeatherItemDetails(
                                          cityWeather: cityWeather,
                                        ),
                                      ),
                                    );
                                  },
                                  child: WeatherHorizontalItem(
                                    searchedCityWeather: cityWeather,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            );
          } else if (state is SearchError) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      hintText: 'Search City',
                      hintStyle: const TextStyle(color: AppColors.grey),
                      label: const Text('Search City'),
                      labelStyle: const TextStyle(color: AppColors.grey),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                          child: IconButton(
                            onPressed: () {
                              searchController.text.isEmpty ||
                                      searchController.text == ''
                                  ? null
                                  : searchCubit.searchCity(
                                      searchController.text,
                                    );
                            },
                            icon: const Icon(
                              Icons.search,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Icon(
                          Icons.error,
                          size: 50,
                          color: AppColors.errorColor,
                        ),
                        Text(
                          state.message,
                          style: Theme.of(context).textTheme.headlineLarge!
                              .copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      hintText: 'Search City',
                      hintStyle: const TextStyle(color: AppColors.grey),
                      label: const Text('Search City'),
                      labelStyle: const TextStyle(color: AppColors.grey),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                          child: IconButton(
                            onPressed: () {
                              searchController.text.isEmpty ||
                                      searchController.text == ''
                                  ? null
                                  : searchCubit.searchCity(
                                      searchController.text,
                                    );
                            },
                            icon: const Icon(
                              Icons.search,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Image.asset(
                      'assets/images/wow_such_empty.png',
                      width: 300,
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
