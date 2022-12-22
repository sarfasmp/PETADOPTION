// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:animaladopt/src/screens/homeScreen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:animaladopt/main.dart';

void main() {
  testWidgets('Want to test TextField', (WidgetTester tester) async {
    final textField = find.byKey(const ValueKey("textField"));

    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));
    await tester.enterText(textField, "Minnu");
    //await tester.pump();

    expect(find.text('Minnu'), findsOneWidget);
  });
}
