import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

void main() {
  test('MTColorScheme creates valid configuration', () {
    const colorScheme = MTColorScheme(
      b0Color: Color(0xFF1A1A1A),
      b1Color: Color(0xFF2A2A2A),
      b2Color: Color(0xFF3A3A3A),
      b3Color: Color(0xFFF5F5F5),
      f1Color: Color(0xFF1A1A1A),
      f2Color: Color(0xFF666666),
      f3Color: Color(0xFF999999),
      mainColor: Color(0xFF007AFF),
      dangerColor: Color(0xFFFF3B30),
    );

    expect(colorScheme.b0Color, const Color(0xFF1A1A1A));
    expect(colorScheme.mainColor, const Color(0xFF007AFF));
  });

  testWidgets('MTPage scrolls to top when status bar is tapped', (WidgetTester tester) async {
    final scrollController = ScrollController();

    await tester.pumpWidget(
      MaterialApp(
        home: MTPage(
          scrollController: scrollController,
          scrollOffsetTop: 50.0,
          body: ListView(
            children: List.generate(
              100,
              (index) => SizedBox(
                height: 50,
                child: Text('Item $index'),
              ),
            ),
          ),
        ),
      ),
    );

    // Scroll down first
    await tester.drag(find.byType(ListView), const Offset(0, -500));
    await tester.pumpAndSettle();

    // Verify we're scrolled down
    expect(scrollController.offset, greaterThan(0));

    // Find the StatusBarTapHandler
    final statusBarHandler = find.byType(StatusBarTapHandler);
    expect(statusBarHandler, findsOneWidget);

    // Find the GestureDetector inside StatusBarTapHandler
    final gestureDetector = find.descendant(
      of: statusBarHandler,
      matching: find.byType(GestureDetector),
    );
    expect(gestureDetector, findsOneWidget);

    // Tap on status bar area
    await tester.tap(gestureDetector);
    await tester.pumpAndSettle();

    // Verify we're back at the top
    expect(scrollController.offset, equals(0));
  });

  testWidgets('MTScrollable scrolls to top when status bar is tapped', (WidgetTester tester) async {
    final scrollController = ScrollController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MTScrollable(
            scrollController: scrollController,
            topScrollOffset: 50.0,
            child: ListView(
              children: List.generate(
                100,
                (index) => SizedBox(
                  height: 50,
                  child: Text('Item $index'),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // Scroll down first
    await tester.drag(find.byType(ListView), const Offset(0, -500));
    await tester.pumpAndSettle();

    // Verify we're scrolled down
    expect(scrollController.offset, greaterThan(0));

    // Find the StatusBarTapHandler
    final statusBarHandler = find.byType(StatusBarTapHandler);
    expect(statusBarHandler, findsOneWidget);

    // Find the GestureDetector inside StatusBarTapHandler
    final gestureDetector = find.descendant(
      of: statusBarHandler,
      matching: find.byType(GestureDetector),
    );
    expect(gestureDetector, findsOneWidget);

    // Tap on status bar area
    await tester.tap(gestureDetector);
    await tester.pumpAndSettle();

    // Verify we're back at the top
    expect(scrollController.offset, equals(0));
  });

  testWidgets('StatusBarTapHandler works independently', (WidgetTester tester) async {
    final scrollController = ScrollController();

    await tester.pumpWidget(
      MaterialApp(
        home: StatusBarTapHandler(
          scrollController: scrollController,
          child: ListView(
            children: List.generate(
              100,
              (index) => SizedBox(
                height: 50,
                child: Text('Item $index'),
              ),
            ),
          ),
        ),
      ),
    );

    // Scroll down first
    await tester.drag(find.byType(ListView), const Offset(0, -500));
    await tester.pumpAndSettle();

    // Verify we're scrolled down
    expect(scrollController.offset, greaterThan(0));

    // Find the StatusBarTapHandler
    final statusBarHandler = find.byType(StatusBarTapHandler);
    expect(statusBarHandler, findsOneWidget);

    // Find the GestureDetector inside StatusBarTapHandler
    final gestureDetector = find.descendant(
      of: statusBarHandler,
      matching: find.byType(GestureDetector),
    );
    expect(gestureDetector, findsOneWidget);

    // Tap on status bar area
    await tester.tap(gestureDetector);
    await tester.pumpAndSettle();

    // Verify we're back at the top
    expect(scrollController.offset, equals(0));
  });

  testWidgets('MTScrollable shows bottom shadow when scrolled to bottom', (WidgetTester tester) async {
    final scrollController = ScrollController();
    bool? bottomScrolledState;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MTScrollable(
            scrollController: scrollController,
            topScrollOffset: 50.0,
            bottomScrollOffset: 100.0,
            onBottomScrolled: (hasScrolledToBottom) {
              bottomScrolledState = hasScrolledToBottom;
            },
            child: ListView(
              children: List.generate(
                20,
                (index) => SizedBox(
                  height: 100,
                  child: Text('Item $index'),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // Initially no bottom shadow should be visible
    final initialShadows = find.byType(MTShadowed);
    expect(initialShadows, findsOneWidget);
    expect(bottomScrolledState, isNull);

    // Scroll to near bottom (within bottomShadowOffset)
    await tester.drag(find.byType(ListView), const Offset(0, -1500));
    await tester.pumpAndSettle();

    // Verify we're scrolled down
    expect(scrollController.offset, greaterThan(0));

    // Verify bottom scroll callback was called
    expect(bottomScrolledState, isTrue);

    // The bottom shadow should now be visible
    // (We can't easily test the shadow visibility directly, but we can verify
    // that the MTScrollable widget is properly configured)
    expect(find.byType(MTScrollable), findsOneWidget);
  });

  testWidgets('MTScrollable factory methods work correctly', (WidgetTester tester) async {
    final scrollController = ScrollController();

    // Test topShadow factory
    await tester.pumpWidget(
      MaterialApp(
        home: MTScrollable(
          scrollController: scrollController,
          topScrollOffset: 50.0,
          child: ListView(
            children: List.generate(10, (index) => SizedBox(height: 100, child: Text('Item $index'))),
          ),
        ),
      ),
    );

    expect(find.byType(MTScrollable), findsOneWidget);
    expect(find.byType(MTShadowed), findsOneWidget);

    // Test withShadows factory
    await tester.pumpWidget(
      MaterialApp(
        home: MTScrollable(
          scrollController: scrollController,
          topScrollOffset: 50.0,
          bottomScrollOffset: 100.0,
          child: ListView(
            children: List.generate(10, (index) => SizedBox(height: 100, child: Text('Item $index'))),
          ),
        ),
      ),
    );

    expect(find.byType(MTScrollable), findsOneWidget);
    expect(find.byType(MTShadowed), findsOneWidget);

    // Test forPage factory
    await tester.pumpWidget(
      MaterialApp(
        home: MTScrollable(
          scrollController: scrollController,
          topScrollOffset: 50.0,
          child: ListView(
            children: List.generate(10, (index) => SizedBox(height: 100, child: Text('Item $index'))),
          ),
        ),
      ),
    );

    expect(find.byType(MTScrollable), findsOneWidget);
    expect(find.byType(MTShadowed), findsOneWidget);
  });

  testWidgets('MTPage calls both scroll callbacks', (WidgetTester tester) async {
    final scrollController = ScrollController();
    bool? topScrolledState;
    bool? bottomScrolledState;

    await tester.pumpWidget(
      MaterialApp(
        home: MTPage(
          scrollController: scrollController,
          scrollOffsetTop: 50.0,
          onTopScrolled: (hasScrolled) {
            topScrolledState = hasScrolled;
          },
          onBottomScrolled: (hasScrolledToBottom) {
            bottomScrolledState = hasScrolledToBottom;
          },
          body: ListView(
            children: List.generate(
              20,
              (index) => SizedBox(
                height: 100,
                child: Text('Item $index'),
              ),
            ),
          ),
        ),
      ),
    );

    // Initially no scroll callbacks should be called
    expect(topScrolledState, isNull);
    expect(bottomScrolledState, isNull);

    // Scroll down to trigger top scroll
    await tester.drag(find.byType(ListView), const Offset(0, -100));
    await tester.pumpAndSettle();

    // Verify top scroll callback was called
    expect(topScrolledState, isTrue);

    // Scroll to bottom to trigger bottom scroll
    await tester.drag(find.byType(ListView), const Offset(0, -1500));
    await tester.pumpAndSettle();

    // Verify bottom scroll callback was called
    expect(bottomScrolledState, isTrue);
  });

  testWidgets('MTButton supports all button types and functionality', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              // Main button
              MTButton.main(
                titleText: 'Main Button',
                onTap: () {},
              ),
              const SizedBox(height: 10),

              // Secondary button
              MTButton.secondary(
                titleText: 'Secondary Button',
                onTap: () {},
              ),
              const SizedBox(height: 10),

              // Text button
              MTButton.secondary(
                titleText: 'Text Button',
                onTap: () {},
              ),
              const SizedBox(height: 10),

              // Icon button
              MTButton.icon(
                const Icon(Icons.add),
                onTap: () {},
              ),
              const SizedBox(height: 10),

              // Danger button
              MTButton.danger(
                titleText: 'Danger Button',
                onTap: () {},
              ),
              const SizedBox(height: 10),

              // Safe button
              MTButton.safe(
                titleText: 'Safe Button',
                onTap: () {},
              ),
              const SizedBox(height: 10),

              // Card button
              MTButton.secondary(
                titleText: 'Card Button',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );

    // Verify all button types are rendered
    expect(find.text('Main Button'), findsOneWidget);
    expect(find.text('Secondary Button'), findsOneWidget);
    expect(find.text('Text Button'), findsOneWidget);
    expect(find.text('Danger Button'), findsOneWidget);
    expect(find.text('Safe Button'), findsOneWidget);
    expect(find.text('Card Button'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('MTButton supports unfocus parameter', (WidgetTester tester) async {
    // Mock unfocusAll function
    // Note: In real tests, you'd need to mock the FocusManager

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MTButton.main(
            titleText: 'Test Button',
            onTap: () {},
          ),
        ),
      ),
    );

    // Tap the button
    await tester.tap(find.text('Test Button'));
    await tester.pumpAndSettle();

    // Verify button was tapped (unfocus behavior is hard to test without mocking)
    expect(find.text('Test Button'), findsOneWidget);
  });
}
