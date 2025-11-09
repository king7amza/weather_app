import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/themes/app_colors.dart';
import 'package:weather_app/features/search/view_models/search_cubit/search_cubit.dart';

class WeatherSearchBar extends StatelessWidget {
  final TextEditingController cityController;
  final TextEditingController? countryController;
  final TextEditingController? stateController;
  final SearchCubit searchCubit;
  final Color searchBackgroundColor;
  final void Function() onPressed;
  const WeatherSearchBar({
    super.key,
    required this.cityController,
    required this.searchCubit,
    required this.searchBackgroundColor,
    required this.onPressed,
    this.countryController,
    this.stateController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: cityController,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              hintText: 'Enter City',
              hintStyle: const TextStyle(color: AppColors.grey),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: searchBackgroundColor,
                  ),
                  child: IconButton(
                    onPressed: onPressed,
                    icon: const Icon(Icons.search, color: AppColors.white),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
            ),
            child: ExpansionTile(
              title: const Text(
                'more options',
                style: TextStyle(color: AppColors.white),
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.white,
              ),
              children: [
                TextFormField(
                  controller: stateController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Enter State or ISO code',
                    hintStyle: const TextStyle(color: AppColors.grey),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: countryController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Enter Country ISO code',
                    hintStyle: const TextStyle(color: AppColors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
