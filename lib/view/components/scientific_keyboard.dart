import 'package:calculator_final/view/components/scientific_numpad.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ScientificKeyboard extends StatefulWidget {
  const ScientificKeyboard({Key? key}) : super(key: key);

  @override
  _ScientificKeyboardState createState() => _ScientificKeyboardState();
}

class _ScientificKeyboardState extends State<ScientificKeyboard>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..addListener(_listener);
  }

  void _listener() {
    if (!controller.isAnimating) {
      setState(() {
        isOpen = controller.isCompleted && controller.value == 1;
      });
    }
  }

  void onTap() {
    controller.isCompleted ? controller.reverse() : controller.forward();
  }

  bool isOpen = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double _currentX = 0;

  _onDrag(details) {
    var maxWidth = MediaQuery.of(context).size.width;

    var x = details.globalPosition.dx;
    _currentX = x;
    var v = math.max(0.0, 1 - (_currentX / maxWidth - 0.5) * 2);
    controller.value = v;
  }

  _onDragEnd(_) {
    if (controller.value > .5) {
      controller.animateTo(1);
    } else {
      controller.animateTo(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          width: maxWidth,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: 0.3 * controller.value,
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: maxWidth * 0.9 - (controller.value * maxWidth * 0.9),
                bottom: 0,
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xfff0f0f0),
                    ),
                  ),
                  width: maxWidth,
                  child: LayoutBuilder(
                    builder: (context, BoxConstraints constraints) {
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          GestureDetector(
                            onTap: onTap,
                            onPanDown: (details) {
                              _currentX = details.globalPosition.dx;
                            },
                            onPanStart: _onDrag,
                            onPanUpdate: _onDrag,
                            onPanEnd: _onDragEnd,
                            child: Container(
                              alignment: Alignment.center,
                              color: Color(0xfff0f0f0),
                              width: constraints.maxWidth * 0.1,
                              child: Icon(
                                isOpen
                                    ? Icons.keyboard_arrow_right
                                    : Icons.keyboard_arrow_left,
                                color: Color(0xff004f94),
                              ),
                            ),
                          ),
                          SizedBox(
                            child: ScientificNumpad(),
                            width: constraints.maxWidth * 0.9,
                            height: constraints.maxHeight,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
