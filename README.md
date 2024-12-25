# Holdable Circular Button

A customizable Flutter widget for a circular button with a progress indicator.

## Features

- **Holdable Button**: Press and hold the button to trigger a progress animation.
- **Customizable**: You can change the size, color, and duration of the button and progress indicator.
- **Progress Indicator**: Visual progress indicator around the button, which completes after a set duration.

## Installation

Add this to your `pubspec.yaml` file:

```yaml
dependencies:
  holdable_circular_button: ^0.0.1

## Screenshots

![Holdable Circular Button Example](assets/screenshot.png)

**Installation:**
dependencies:
  holdable_circular_button: ^0.0.1

Example:
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: HoldableCircularButton(
          progressColor: Colors.green,
          buttonColor: Colors.red,
          onComplete: () {},
          icon: Icon(Icons.touch_app_outlined),
        ),
      ),
    );
  }
}


