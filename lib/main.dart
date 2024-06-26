import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
                const AspectRatio(
                  aspectRatio: 1,
                  child: Placeholder(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          '** ℃',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Colors.blue,
                                  ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          '** ℃',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Colors.red,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.only(top: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            onPressed: () {
                              debugPrint('Reload');
                            },
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
