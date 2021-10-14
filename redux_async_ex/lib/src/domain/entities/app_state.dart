// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';

/// The app state, which in this case is a counter, a description, and a waiting flag.
@immutable
class AppState {
  final int counter;
  final String description;
  final bool waiting;

  const AppState({
    required this.counter,
    required this.description,
    required this.waiting,
  });

  AppState copy({int? counter, String? description, bool? waiting}) => AppState(
        counter: counter ?? this.counter,
        description: description ?? this.description,
        waiting: waiting ?? this.waiting,
      );

  // ignore: prefer_constructors_over_static_methods
  static AppState initialState() =>
      const AppState(counter: 0, description: "", waiting: false);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          counter == other.counter &&
          description == other.description &&
          waiting == other.waiting;

  @override
  int get hashCode =>
      counter.hashCode ^ description.hashCode ^ waiting.hashCode;
}
