// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:labten/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    await tester.enterText(find.byKey(Key("EmailInput")), "myemail@gmail.com");
    expect(find.text('myemail@gmail.com'),findsOneWidget);
  });
  testWidgets('Tap test', (WidgetTester tester)async{
    await tester.pumpWidget(MyApp());
    await tester.tap(find.byKey(Key("registerButton")));
    await tester.pumpAndSettle();
    expect(find.text("Создать аккаунт"),findsOneWidget);
  });
  testWidgets('Drag test', (WidgetTester tester) async{
    await tester.pumpWidget(MyApp());
    await tester.drag(find.text("first"), const Offset(500.0, 0.0));
    await tester.pumpAndSettle();
    expect(find.text('first'), findsNothing);
  });
}
