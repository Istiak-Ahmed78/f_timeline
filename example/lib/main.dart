import 'package:f_timeline/f_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: FTimelineExample(),
      ),
    );
  }
}

class FTimelineExample extends StatelessWidget {
  FTimelineExample({Key? key}) : super(key: key);
  final List<MyTimeLineModel> timeLineModels = const [
    MyTimeLineModel(
      title: 'Taken',
      content: Center(
        child: Text('Your order is taken'),
      ),
    ),
    MyTimeLineModel(
      title: 'Taken',
      content: Center(
        child: Text('Your order is taken'),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MyTimeLine(
        timelines: timeLineModels, timeLineState: TimeLineState.processing);
  }
}
