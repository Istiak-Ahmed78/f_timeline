import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/material.dart' hide StatefulWidget;

// abstract class StatefulWidget extends Widget {
//   @override
//   Element createElement() =>StatefulElement( this);
// }

enum _StateLifeCycle {
  created,
  intitiaed,
  ready,
  defunct,
}

abstract class MyStateClass<T extends StatefulWidget> with Diagnosticable {
  T get widget {
    assert(_widget != null);
    return _widget!;
  }

  T? _widget;
  StatefulElement? _statefulElement;

  BuildContext get context {
    assert(_statefulElement != null);
    return _statefulElement!;
  }

  bool get isMouted => _statefulElement != null;

  _StateLifeCycle _debugLifeCyleState = _StateLifeCycle.created;

  @mustCallSuper
  @protected
  void inItState() {
    assert(_debugLifeCyleState == _StateLifeCycle.created);
  }

  @mustCallSuper
  @protected
  void didChangeDepenDency(covariant T oldWidget) {}
}
