import 'package:flutter/material.dart';
import 'package:test_task/home_page.dart';

void main() {
  runApp(const Main());
}

///Main widget
class Main extends StatelessWidget {
  /// Constant constructor for Main
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
