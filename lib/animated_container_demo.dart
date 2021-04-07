import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  final title = "Animated Container Demo";
  double _size = 50; // starting size
  bool _animate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              "Animate a Container widget",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() {
                _size == 50 ? _size = 250 : _size = 50;
              }),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Center(
                  child: _animate
                      ? MyAnimatedContainer(
                          size: _size,
                        )
                      : MyContainer(
                          size: _size,
                        ),
                ),
              ),
            ),
          ),
          Text(
            "Animate?",
            style: Theme.of(context).textTheme.headline6,
          ),
          Switch(
              value: _animate,
              onChanged: (newValue) => setState(() {
                    _animate = newValue;
                  })),
        ],
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  MyContainer({@required this.size});
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: FlutterLogo(),
    );
  }
}

class MyAnimatedContainer extends StatelessWidget {
  MyAnimatedContainer({@required this.size});
  final double size;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInQuad,
      width: size,
      height: size,
      child: FlutterLogo(),
    );
  }
}
