// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';

/// The view-model holds the part of the Store state the dumb-widget needs.
class ViewModel extends Vm {
  final int counter;
  final String description;
  final bool waiting;
  final VoidCallback onIncrement;

  ViewModel({
    required this.counter,
    required this.description,
    required this.waiting,
    required this.onIncrement,
  }) : super(equals: [counter, description, waiting]);
}
