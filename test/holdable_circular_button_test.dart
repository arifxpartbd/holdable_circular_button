import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holdable_circular_button/holdable_circular_button.dart';

void main() {
  testWidgets('HoldableCircularButton updates progress on long press',
      (WidgetTester tester) async {
    // Create the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HoldableCircularButton(
            onComplete: () {},
            icon: Icon(Icons.touch_app_rounded),
          ),
        ),
      ),
    );

    // Find the button (by its icon)
    final buttonFinder = find.byType(HoldableCircularButton);

    // Ensure the button exists
    expect(buttonFinder, findsOneWidget);

    // Perform a long press to simulate the button being held
    await tester.longPress(buttonFinder);

    // Allow some time for the progress to update
    await tester.pump(); // Ensure the widget is updated once

    // Check if progress has started (value is greater than 0)
    final circularProgressIndicator = tester.widget<CircularProgressIndicator>(
      find.byType(CircularProgressIndicator),
    );

    // Expect that progress value has started (greater than 0)
    expect(circularProgressIndicator.value, greaterThan(0.0));

    // Wait for the progress to complete
    await tester.pumpAndSettle(); // Wait for the animation to complete

    // Verify that the progress value is now 1 (complete)
    expect(circularProgressIndicator.value, equals(1.0));

    // Ensure that the button still exists after the completion
    expect(find.byType(HoldableCircularButton), findsOneWidget);
  });
}
