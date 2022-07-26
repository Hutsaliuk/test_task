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
  Color? _mainBackgroundColor;
  Color? _secondBackgroundColor;
  var _isScreenPressed = false;
  Offset _pressedCenterOffset = Offset.zero;

  void _onDragStart(DragStartDetails details) {
    setState(() {
      if (!_isScreenPressed) {
        _secondBackgroundColor = ColorGenerator.generateColor();
        _isScreenPressed = true;
      }
      _pressedCenterOffset = details.globalPosition;
    });
  }

  void _onDragEnd(DragEndDetails _) {
    setState(() {
      _isScreenPressed = false;
      _mainBackgroundColor = _secondBackgroundColor;
    });
  }

  void _onTapUp(TapUpDetails _) {
    setState(() {
      _mainBackgroundColor = ColorGenerator.generateColor();
    });
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      _pressedCenterOffset = details.globalPosition;
    });
  }

  @override
  void initState() {
    super.initState();
    _mainBackgroundColor = ColorGenerator.generateColor();
  }

  @override
  Widget build(BuildContext context) {
    final _windowSize = MediaQuery.of(context).size;
    final _gradientAlignment = Alignment(
      _pressedCenterOffset.dx / (_windowSize.width / 2) - 1,
      _pressedCenterOffset.dy / (_windowSize.height / 2) - 1,
    );

    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onVerticalDragStart: _onDragStart,
        onHorizontalDragStart: _onDragStart,
        onVerticalDragEnd: _onDragEnd,
        onHorizontalDragEnd: _onDragEnd,
        onTapUp: _onTapUp,
        onHorizontalDragUpdate: _onDragUpdate,
        onVerticalDragUpdate: _onDragUpdate,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _mainBackgroundColor,
            gradient: _isScreenPressed
                ? RadialGradient(
                    center: _gradientAlignment,
                    colors: [
                      _secondBackgroundColor ?? Colors.transparent,
                      _mainBackgroundColor ?? Colors.transparent,
                    ],
                  )
                : null,
          ),
          child: const Text(
            'Hey there',
          ),
        ),
      ),
    );
  }
}
