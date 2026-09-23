import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio/main.dart';

void main() {
  testWidgets('Portfolio loads cleanly on desktop viewport without errors', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1440, 1080);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Verify brand name & app icon
    expect(find.byType(Image), findsWidgets);
    expect(find.text('Priyesh Dabre'), findsWidgets);

    // Verify core sections exist
    expect(find.text('CORE COMPETENCIES'), findsOneWidget);
    expect(find.text('FEATURED WORK'), findsOneWidget);
    expect(find.text('CAREER TIMELINE'), findsOneWidget);
    expect(find.text('GET IN TOUCH'), findsOneWidget);

    // Verify projects are present
    expect(find.text('myTime'), findsOneWidget);
    expect(find.text('TrueCoverage'), findsOneWidget);
  });

  testWidgets('Portfolio renders cleanly on mobile viewport without overflow', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Verify brand app icon
    expect(find.byType(Image), findsWidgets);

    // Verify hero text
    expect(find.text('Priyesh Dabre'), findsWidgets);

    // Scroll through the entire page to verify no RenderFlex overflow occurs
    final scrollFinder = find.byType(SingleChildScrollView);
    expect(scrollFinder, findsOneWidget);

    await tester.drag(scrollFinder, const Offset(0, -500));
    await tester.pumpAndSettle();

    await tester.drag(scrollFinder, const Offset(0, -800));
    await tester.pumpAndSettle();

    await tester.drag(scrollFinder, const Offset(0, -1000));
    await tester.pumpAndSettle();
  });
}
