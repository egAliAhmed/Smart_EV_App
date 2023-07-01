import 'package:flutter_test/flutter_test.dart';

import 'package:webview/main.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  testWidgets('Example Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the WebView widget exists.
    expect(find.byType(WebView), findsOneWidget);

    // You can write additional tests here based on your app's behavior.
    // For example, you could test interaction with the WebView widget.
  });
}
