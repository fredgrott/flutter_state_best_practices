// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyCounter extends StatefulWidget {
  final Color textColor;
  const MyCounter({Key? key, required this.textColor}) : super(key: key);
  @override
  _MyCounterController createState() => _MyCounterController();
}

class _MyCounterController extends State<MyCounter> {
  int counter = 0;
  @override
  Widget build(BuildContext context) => _MyCounterView(this);
  void handleCounterPressed() => setState(() => counter += 1);
}

class _MyCounterView extends StatelessWidget {
  final _MyCounterController state;
  const _MyCounterView(this.state, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: state.handleCounterPressed,
      child: Text(
        "${state.counter}",
        style: TextStyle(color: state.widget.textColor),
      ),
    );
  }
}
