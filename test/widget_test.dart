import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:open_study_app/main.dart';

void main() {
  testWidgets('shows the search bar and the about button', (tester) async {
    await tester.pumpWidget(const OpenStudyApp());

    expect(find.text('Open Study'), findsWidgets);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byIcon(Icons.info_outline_rounded), findsOneWidget);
  });

  testWidgets('about screen explains sources and privacy', (tester) async {
    await tester.pumpWidget(const OpenStudyApp());

    await tester.tap(find.byIcon(Icons.info_outline_rounded));
    await tester.pumpAndSettle();

    expect(find.text('Where results come from'), findsOneWidget);

    // The list is long; scroll down until the privacy heading is built.
    await tester.scrollUntilVisible(
      find.text('Privacy'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Privacy'), findsOneWidget);
  });
}
