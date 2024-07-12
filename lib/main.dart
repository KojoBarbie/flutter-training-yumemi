import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/type.dart';
import 'package:flutter_training/yumemi_weather_repository.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final YumemiWeatherRepository _repository = YumemiWeatherRepository();
  // なんかちがそうだけどWidgetごとsetStateしたかったのでWidgetを定義
  Widget _weatherWidget = const Placeholder();

  Future<void> setWeather() async {
    try {
      final weather = await _repository.fetchWeather();

      switch (weather) {
        case Weather.sunny:
          setState(() {
            _weatherWidget = SvgPicture.asset(
              'assets/svg/sunny.svg',
              semanticsLabel: 'Sunny',
            );
          });
        case Weather.cloudy:
          setState(() {
            _weatherWidget = SvgPicture.asset(
              'assets/svg/cloudy.svg',
              semanticsLabel: 'Cloudy',
            );
          });
        case Weather.rainy:
          setState(() {
            _weatherWidget = SvgPicture.asset(
              'assets/svg/rainy.svg',
              semanticsLabel: 'Rainy',
            );
          });
      }
    } on Exception catch (e) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          key: const Key('snackBar'),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.white,
          content: Text(
            e.toString(),
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
                AspectRatio(
                  aspectRatio: 1,
                  child: _weatherWidget,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '** ℃',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Colors.blue,
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '** ℃',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Colors.red,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.only(top: 80),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              debugPrint('Close');
                            },
                            child: const Text('Close'),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: setWeather,
                            child: const Text('Reload'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
