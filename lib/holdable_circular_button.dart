import 'package:flutter/material.dart';

/// A customizable holdable circular button with a progress indicator.
class HoldableCircularButton extends StatefulWidget {
  final VoidCallback onComplete;
  final double size; // Button size
  final Color progressColor; // Progress bar color
  final Color buttonColor; // Button's inner color
  final Color iconColor; // Icon color
  final Icon icon; // Icon for the button
  final Duration duration;

  const HoldableCircularButton({
    super.key,
    required this.onComplete,
    this.size = 100.0,
    this.progressColor = Colors.green,
    this.buttonColor = Colors.blue, // Default button color
    this.iconColor = Colors.white, // Default icon color
    required this.icon, // Icon is required
    this.duration = const Duration(seconds: 5),
  });

  @override
  HoldableCircularButtonState createState() => HoldableCircularButtonState();
}

class HoldableCircularButtonState extends State<HoldableCircularButton> {
  double _progress = 0.0;
  bool _isPressed = false;

  void _startProgress() {
    setState(() {
      _isPressed = true;
      _progress = 0.0;
    });

    Future.doWhile(() async {
      await Future.delayed(Duration(milliseconds: 50));
      if (_isPressed) {
        setState(() {
          _progress += 0.02;
        });
        return _progress < 1.0;
      }
      return false;
    }).then((_) {
      if (_progress >= 1.0) {
        widget.onComplete();
        setState(() {
          _isPressed = false;
          _progress = 0.0;
        });
      }
    });
  }

  void _stopProgress() {
    setState(() {
      _isPressed = false;
      _progress = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (_) => _startProgress(),
      onLongPressEnd: (_) => _stopProgress(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Circular progress indicator
          SizedBox(
            width: widget.size,
            height: widget.size,
            child: CircularProgressIndicator(
              value: _progress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation(widget.progressColor),
              strokeWidth: 8,
            ),
          ),
          // Circular button
          Container(
            width: widget.size - 20,
            height: widget.size - 20,
            decoration: BoxDecoration(
              color: widget.buttonColor, // Button's inner color
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                widget.icon.icon, // Icon data from user input
                color: widget.iconColor, // Icon color now customizable
                size: widget.size / 3, // Icon size is customizable
              ),
            ),
          ),
        ],
      ),
    );
  }
}
