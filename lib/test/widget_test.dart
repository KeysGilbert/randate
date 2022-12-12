import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:randate/view/home_page.dart';
import 'package:mockito/mockito.dart';
import 'package:randate/view/result_page.dart';
import 'package:provider/provider.dart';
import 'package:randate/controller/date.dart';
import 'widget_test.mocks.dart' as mock;

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

@GenerateMocks([http.Client, MockNavigatorObserver])
void main() {
  testWidgets("result page loads successfully with successful API call",
      (tester) async {
    final mockObserver = MockNavigatorObserver(); //to test navigation behavior
    final mockRequest = mock.MockClient();

  //fake http request
    when(mockRequest.get(Uri.parse(
            "https://www.boredapi.com/api/activity?type=recreational&participants=1")))
        .thenAnswer(
            (_) async => http.Response(json.encode({'fake': 'response'}), 200));

    await tester.pumpWidget(ChangeNotifierProvider(
      create: ((context) => Date()),
      child: MaterialApp(
        home: HomePage(),
        navigatorObservers: [mockObserver],
      ),
    ));

    final spinButton = find.byType(ElevatedButton);
    await tester.tap(spinButton); //user taps button

    await tester.pumpAndSettle();

    //verify nagivation occured
    verify(mockObserver.didPush(
        MaterialPageRoute(builder: (context) => ResultPage()), any));
    expect(find.byType(ResultPage), findsOneWidget);
  });
}

/*
 //fake http request
    when(mockRequest.get(url))
        .thenAnswer((_) async => http.Response('{"fake" : "response"}', 200));
*/