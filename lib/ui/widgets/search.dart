import 'package:flutter/material.dart';
import 'package:weathet_app/di/di.dart';
import 'package:weathet_app/features/weather/cubits/weather.dart';
import 'package:weathet_app/ui/widgets/decorated_card.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DecoratedCard(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                    hintText: 'Enter city name',
                    border: InputBorder.none,
                    prefixIcon: IconButton(
                        onPressed: () => _searchWeather(),
                        icon: const Icon(Icons.search))),
                onSubmitted: (_) => _searchWeather(),
              ),
            ),
          ),
          Flexible(
            child: DecoratedCard(
              child: IconButton(
                  onPressed: () => {},
                  icon: const Icon(
                    Icons.location_pin,
                    color: Color(0xff54AC57),
                  )),
            ),
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
