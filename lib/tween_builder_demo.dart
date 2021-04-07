import 'dart:developer';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class TweenBuilderDemo extends StatefulWidget {
  @override
  _TweenBuilderDemoState createState() => _TweenBuilderDemoState();
}

class _TweenBuilderDemoState extends State<TweenBuilderDemo> {
  final title = "Tween Builder Demo";
  double _sliderValue = 0;
  double _angle = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: Text(
              "Animate between two values",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Expanded(
            child: FractionallySizedBox(
              widthFactor: .5,
              heightFactor: .8,
              child: RotationAngleTweenBuilder(newAngle: _angle),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: FractionallySizedBox(
                  widthFactor: .75,
                  child: Slider.adaptive(
                      value: _sliderValue,
                      onChanged: (value) => {
                            setState(() {
                              _sliderValue = value;

                              /// lerpDouble(num a, num b, double t)
                              /// where `a` is the initial value,
                              /// `b` is the final value,
                              /// and `t` is the 'speed' or 'factor'
                              /// (i.e. the value of this slider, between 0 and
                              /// 2 pi in this case).
                              _angle = lerpDouble(0, 2 * math.pi, _sliderValue);
                            })
                          }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RotationAngleTweenBuilder extends StatelessWidget {
  const RotationAngleTweenBuilder({@required this.newAngle});

  final double newAngle;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        duration: const Duration(milliseconds: 500),

        /// Animate between the last value and the `end` value.
        tween: Tween<double>(begin: 0, end: newAngle),
        builder: (BuildContext context, double angle, Widget child) {
          // log("new value: ${angle.toString()} ");
          return Transform.rotate(
            angle: angle,
            child: FlutterLogo(),
          );
        });
  }
}
