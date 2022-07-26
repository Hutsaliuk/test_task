import 'package:flutter/material.dart';
import 'package:test_task/color_generator.dart';

/// Home page for my test task
class HomePage extends StatefulWidget {
  /// Constant constructor for [HomePage] widget.
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color? _backgroundColor;

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = ColorGenerator.generateColor();
    });
  }

  @override
  void initState() {
    super.initState();
    _backgroundColor = ColorGenerator.generateColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _changeBackgroundColor,
        child: const Center(
          child: Text(
            'Hey there',
          ),
        ),
      ),
    );
  }
}
