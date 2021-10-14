// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:async_redux/async_redux.dart';
import 'package:redux_async_ex/src/domain/entities/app_state.dart';

class BarrierAction extends ReduxAction<AppState> {
  final bool waiting;

  // ignore: avoid_positional_boolean_parameters
  BarrierAction(this.waiting);

  @override
  AppState reduce() {
    return state.copy(waiting: waiting);
  }
}
