import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock_navigation.dart';

void main() {
  late MockNavigatorObserver mockObserver;

  setUpAll(() {
    registerFallbackValue(FakeRoute());
  });

  setUp(() {
    mockObserver = MockNavigatorObserver();
  });

  testWidgets('Should display all widgets when opened',
      (WidgetTester tester) async {
    final scaffold = find.byType(Scaffold);
    final image = find.byType(Image);
    final text = find.text(
        'Ditonton merupakan sebuah aplikasi katalog film yang dikembangkan oleh Dicoding Indonesia sebagai contoh proyek aplikasi untuk kelas Menjadi Flutter Developer Expert.');
    final backButton = find.byIcon(Icons.arrow_back);

    await tester.pumpWidget(MaterialApp(
      home: AboutPage(),
      navigatorObservers: [mockObserver],
    ));

    expect(scaffold, findsOne);
    expect(image, findsOne);
    expect(text, findsOne);
    expect(backButton, findsOne);

    await tester.tap(backButton);
    await tester.pump();

    verify(() => mockObserver.didPop(any(), any()));
  });
}
