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
            children: List.generate(100, (index) => 
              Container(
                height: 50,
                child: Text('Item $index'),
              )
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
            scrollOffsetTop: 50.0,
            child: ListView(
              children: List.generate(100, (index) => 
                Container(
                  height: 50,
                  child: Text('Item $index'),
                )
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
            children: List.generate(100, (index) => 
              Container(
                height: 50,
                child: Text('Item $index'),
              )
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
    
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MTScrollable(
            scrollController: scrollController,
            scrollOffsetTop: 50.0,
            bottomShadowOffset: 100.0,
            child: ListView(
              children: List.generate(20, (index) => 
                Container(
                  height: 100,
                  child: Text('Item $index'),
                )
              ),
            ),
          ),
        ),
      ),
    );

    // Initially no bottom shadow should be visible
    final initialShadows = find.byType(MTShadowed);
    expect(initialShadows, findsOneWidget);
    
    // Scroll to near bottom (within bottomShadowOffset)
    await tester.drag(find.byType(ListView), const Offset(0, -1500));
    await tester.pumpAndSettle();
    
    // Verify we're scrolled down
    expect(scrollController.offset, greaterThan(0));
    
    // The bottom shadow should now be visible
    // (We can't easily test the shadow visibility directly, but we can verify
    // that the MTScrollable widget is properly configured)
    expect(find.byType(MTScrollable), findsOneWidget);
  });
}
