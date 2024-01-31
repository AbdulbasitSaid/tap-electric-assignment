import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weathet_app/di/di.dart';
import 'package:weathet_app/features/weather/weather.dart';
import 'package:weathet_app/ui/widgets/barometer_info.dart';
import 'package:weathet_app/ui/widgets/city_info.dart';
import 'package:weathet_app/ui/widgets/decorated_card.dart';
import 'package:weathet_app/ui/widgets/forecast_hours.dart';
import 'package:weathet_app/ui/widgets/search.dart';
import 'package:weathet_app/ui/widgets/wind_information.dart';
import 'package:weathet_app/utils/constants.dart';
import 'package:weathet_app/utils/helpers.dart';
import 'package:flutter/gestures.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  @override
  void initState() {
    getIt<WeatherCubit>().onSubmitLocate();
    super.initState();
  }

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        color: primaryColor,
        onRefresh: () async {
          getIt<WeatherCubit>().onSubmitLocate();
        },
        child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {
            if (state is WeatherDataError) {
              showSnackBar(context, state.error);
            }
          },
          builder: (context, weatherState) {
            if (weatherState is WeatherCubitLoading) {
              return const Center(
                child: SpinKitCubeGrid(color: Colors.blue, size: 80),
              );
            }
            return SafeArea(
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  const Search(),
                  CityInfo(
                    state: weatherState,
                  ),
                  ForecastHours(state: weatherState),
                  WindInformation(weatherState: weatherState),
                  BarometerInfo(weatherState: weatherState),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
