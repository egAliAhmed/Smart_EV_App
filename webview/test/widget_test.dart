import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:webview/main.dart';

void main() {
  testWidgets('Test app with WebView and image', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that WebView is present.
    expect(find.byType(WebView), findsOneWidget);

    // Verify that the initial image is present.
    expect(find.byType(Image), findsOneWidget);

    // Verify that the image is displayed for 10 seconds.
    await tester.pump(Duration(seconds: 10));
    expect(find.byType(Image), findsNothing);

    // Verify that the WebView is present after the image disappears.
    expect(find.byType(WebView), findsOneWidget);

    // Wait for the WebView to finish loading.
    await tester.pumpAndSettle();

    // Verify that the WebView is still present after loading.
    expect(find.byType(WebView), findsOneWidget);
  });
}
