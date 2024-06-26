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
              // mainAxisAlignmentで合わせると、矩形が正しく中央にこない
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AspectRatio(
                  aspectRatio: 1,
                  child: Placeholder(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        '** ℃',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Colors.blue,
                            ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        '** ℃',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Colors.red,
                            ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          debugPrint('Close');
                        },
                        child: const Text('Close'),
                      ),
                      TextButton(
                        onPressed: () {
                          debugPrint('Reload');
                        },
                        child: const Text('Reload'),
                      ),
                    ],
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
