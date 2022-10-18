import 'package:f_timeline/f_timeline.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: FTimelineExample(),
      ),
    );
  }
}

class FTimelineExample extends StatelessWidget {
  const FTimelineExample({Key? key}) : super(key: key);
  List<FTimeLineModel> timeLineModels(BuildContext context) => [
        FTimeLineModel(
          title: 'Taken',
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 1.3,
            child: const Center(
              child: Text('Your order is taken'),
            ),
          ),
        ),
        const FTimeLineModel(
          title: 'Processing',
          content: Center(
            child: Text('Your order is being processed'),
          ),
        ),
        const FTimeLineModel(
          title: 'Packing',
          content: Center(
            child: Text('Hold on,We are making ready your product.'),
          ),
        ),
        const FTimeLineModel(
          title: 'Way to',
          content: Center(
            child: Text('Just some moments. We are on the way'),
          ),
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return FTimeline(timelines: timeLineModels(context), doneTillIndex: 1);
  }
}
