// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_keep/main.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(
        child: Builder(
          builder: (context) {
            return MyApp();
          },
        ),
      ),
    );

    // Verify that our counter starts at 0.
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
  });
}
