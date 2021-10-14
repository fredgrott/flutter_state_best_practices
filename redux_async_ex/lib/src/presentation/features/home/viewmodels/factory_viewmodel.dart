// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:async_redux/async_redux.dart';
import 'package:redux_async_ex/src/domain/entities/app_state.dart';
import 'package:redux_async_ex/src/presentation/features/home/ui/homepage_connector.dart';
import 'package:redux_async_ex/src/presentation/features/home/viewcontrollers/increment_action.dart';
import 'package:redux_async_ex/src/presentation/features/home/viewmodels/view_model.dart';

class Factory extends VmFactory<AppState, MyHomePageConnector> {
  Factory(MyHomePageConnector widget) : super(widget);

  @override
  ViewModel fromStore() => ViewModel(
        counter: state.counter,
        description: state.description,
        waiting: state.waiting,
        onIncrement: () => dispatch(IncrementAndGetDescriptionAction()),
      );
}
