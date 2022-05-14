import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:f_timeline/f_timeline.dart';

void main() {
  List<FTimeLineModel> _timelines = const [
    FTimeLineModel(
        title: 'Taken',
        content: Center(
          child: Text('Your order is taken'),
        )),
    FTimeLineModel(
        title: 'Cooking',
        content: Center(child: Text('Your is being cooked.'))),
    FTimeLineModel(
        title: 'Delivering',
        content: Center(child: Text('Your is on the way.'))),
  ];
  testWidgets('Test main Widget', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: FTimeline(timelines: _timelines, doneTillIndex: 0),
      ),
    ));

    await tester.pump();
    for (final i in _timelines) {
      final textfinder = find.text(i.title);
      expect(textfinder, findsOneWidget);
    }
  });
}
