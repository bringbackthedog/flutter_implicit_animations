import 'dart:developer';

import 'package:flutter/material.dart';

class AnimatedSwitcherDemo extends StatefulWidget {
  @override
  _AnimatedSwitcherDemoState createState() => _AnimatedSwitcherDemoState();
}

class _AnimatedSwitcherDemoState extends State<AnimatedSwitcherDemo> {
  final title = "Animated Switcher Demo";
  Widget child = RedContainer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Text(
                  "Animate between two widgets",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  /// Toggle between RedContainer and BlueContainer
                  child.runtimeType == RedContainer().runtimeType
                      ? child = BlueContainer()
                      : child = RedContainer();
                }),
                child: AnimatedSwitcher(
                  layoutBuilder: AnimatedSwitcher.defaultLayoutBuilder,
                  switchInCurve: Curves.easeInCirc,
                  switchOutCurve: Curves.easeInBack,
                  duration: Duration(milliseconds: 800),
                  transitionBuilder: (child, animation) => ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        width: 150,
        height: 150,
      ),
    );
  }
}

class BlueContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
