import 'package:flutter/material.dart';
import 'package:holdable_circular_button/holdable_circular_button.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Holdable Circular Button app',
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Holdable Circular Button'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: HoldableCircularButton(
            progressColor: Colors.green,
            buttonColor: Colors.red,
            onComplete: () {},
            icon: Icon(Icons.touch_app_outlined),
          ),
        ),
      ),
    );
  }
}
