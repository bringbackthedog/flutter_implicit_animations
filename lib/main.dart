import 'package:flutter/material.dart';
import 'package:flutter_animations/animated_container_demo.dart';
import 'package:flutter_animations/animated_switcher_demo.dart';
import 'package:flutter_animations/tween_builder_demo.dart';

void main() {
  runApp(AnimationsDemo());
}

class AnimationsDemo extends StatelessWidget {
  final String title = "Animations Demo";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              title: Center(
                child: Text("Tween Builder"),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TweenBuilderDemo(),
                  )),
            ),
            ListTile(
              title: Center(
                child: Text("Animated Container Demo"),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimatedContainerDemo(),
                  )),
            ),
            ListTile(
              title: Center(
                child: Text("Implicit Animations"),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimatedSwitcherDemo(),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
