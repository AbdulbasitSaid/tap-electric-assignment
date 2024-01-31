import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weathet_app/di/di.dart';
import 'package:weathet_app/features/weather/weather.dart';
import 'package:weathet_app/utils/constants.dart';
import 'package:weathet_app/utils/helpers.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state is WeatherDataError) {
            showSnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is WeatherCubitLoading) {
            return const Center(
              child: SpinKitCubeGrid(color: Colors.blue, size: 80),
            );
          }
          return const ViewWidget();
        },
      ),
    );
  }
}

class ViewWidget extends StatelessWidget {
  const ViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherState = context.watch<WeatherCubit>().state;
    return SafeArea(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SearchWidget(),
          const SizedBox(height: 30),
          CityInfoWidget(
            state: weatherState,
          ),
          const SizedBox(height: 16),
          ForecastHours(state: weatherState),
          WindInformation(weatherState: weatherState)
        ],
      ),
    );
  }
}

class WindInformation extends StatelessWidget {
  const WindInformation({
    super.key,
    required this.weatherState,
  });

  final WeatherState weatherState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appText(
            size: 32,
            text: 'Wind',
            isBold: FontWeight.bold,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // material wind icon
              const Icon(Icons.wb_sunny, color: primaryColor),
              appText(
                size: 18,
                text:
                    '${weatherState.forecastObject?.current?.windKph} km/h',
              ),
              appText(
                size: 18,
                text: '${weatherState.forecastObject?.current?.windDir}°',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ForecastHours extends StatelessWidget {
  const ForecastHours({
    super.key,
    required this.state,
  });

  final WeatherState state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemCount: state.forecastObject!.forecast!.forecastday![0].hour!.length,
        itemBuilder: (itemBuilder, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText(
                  size: 16,
                  text:
                      '${state.forecastObject?.forecast?.forecastday?[0].hour?[index].timeToHour}',
                ),
                const SizedBox(height: 16),
                appText(
                    size: 18,
                    text:
                        "${state.forecastObject?.forecast?.forecastday?[0].hour?[index].tempC}°"),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CityInfoWidget extends StatelessWidget {
  const CityInfoWidget({super.key, required this.state});
  final WeatherState state;
  @override
  Widget build(BuildContext context) {
    final String? url = makeUri(state.forecastObject);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        url != null ? Image.network(url, scale: 1.2) : const SizedBox(),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appText(
              size: 30,
              text: '${state.forecastObject?.location?.name}',
              isBold: FontWeight.bold,
              color: primaryColor,
            ),
            RotationTransition(
              turns: AlwaysStoppedAnimation(
                  (state.forecastObject?.current?.windDegree ?? 0) / 360),
              child: const Icon(Icons.north, color: primaryColor),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appText(
              size: 70,
              text: '${state.forecastObject?.current?.tempC?.round()}°',
            ),
            appText(
                size: 30,
                color: Colors.black45,
                text: '${state.forecastObject?.current?.tempF?.round()}°')
          ],
        ),
      ],
    );
  }
}

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    _textEditingController.text = '';
    super.initState();
  }

  void _searchWeather() {
    if (_textEditingController.text.length < 3) {
      return;
    }
    getIt<WeatherCubit>().onSubmitSearch(_textEditingController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: 'Enter city name',
              ),
              onSubmitted: (_) => _searchWeather(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _searchWeather,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
