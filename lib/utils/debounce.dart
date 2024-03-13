import 'dart:async';

import 'package:flutter/material.dart';

/// this class contains the code to optimize the search and only send the
/// query for search when the user has stopped typing so as to reduce the
/// api calls for getting the data based on search query of the user.
class Debounce {
  final int milliseconds;
  Timer? _timer;

  Debounce({this.milliseconds = 500});

  void run(VoidCallback action) {
    close();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void close() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }
}
