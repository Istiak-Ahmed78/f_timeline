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
    return const GetMaterialApp(
      home: Scaffold(
        body: FTimelineExample(),
      ),
    );
  }
}

class FTimelineExample extends StatelessWidget {
  const FTimelineExample({Key? key}) : super(key: key);
  final List<MyTimeLineModel> timeLineModels = const [
    MyTimeLineModel(
      title: 'Taken',
      content: Center(
        child: Text('Your order is taken'),
      ),
    ),
    MyTimeLineModel(
      title: 'Processing',
      content: Center(
        child: Text('Your order is being processed'),
      ),
    ),
    MyTimeLineModel(
      title: 'Packing',
      content: Center(
        child: Text('Hold on,We are making ready your product.'),
      ),
    ),
    MyTimeLineModel(
      title: 'Way to',
      content: Center(
        child: Text('Just some moments. We are on the way'),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MyTimeLine(timelines: timeLineModels, doneTillIndex: 0);
  }
}
