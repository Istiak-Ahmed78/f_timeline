# f_timeline


<p align="center">
  <a href="https://pub.dartlang.org/packages/f-timeline">
    <img src="https://img.shields.io/pub/v/f-timeline.svg" alt="Pub" />
  </a>
 
  <a href="https://opensource.org/licenses/MIT">
    <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="License: MIT" />
  </a>
</p>
A flutter package aiming to showing timeline in Flutter

## Demo screenshot

<img src="https://user-images.githubusercontent.com/68919043/168297212-f04ffbd1-5b46-4199-84da-99fd812fa173.jpg" width="200" height="400" />

## Installation

#### Depend on it:
``` yaml
dependencies:
  f_timeline: 0.5.0
```
#### Get packages
``` console
$ flutter pub get
```

#### Import the package in your project

`import 'package:timelines/timelines.dart';`

#### Usage
``` dart
MyTimeLine(timelines: const[
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
  ], doneTillIndex: 0);
  ```
  Check the [Example](https://github.com/Istiak-Ahmed78/f_timeline/blob/master/example/lib/main.dart) 
  

