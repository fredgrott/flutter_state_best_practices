// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:widget_view/src/presentation/features/home/ui/mycounterhome.dart';
import 'package:widget_view/src/presentation/features/home/ui/mycounterwidgetview.dart';



class MyCounterController extends State<MyCounterHome>{

  int counter = 0;
  @override
  // ignore: unnecessary_this
  Widget build(BuildContext context) => MyCounterWidgetView(this.widget);
  void handleCounterPressed() => setState(() => counter += 1);

}