// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:async_redux/async_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:redux_async_ex/src/domain/entities/app_state.dart';
import 'package:redux_async_ex/src/presentation/features/home/ui/myhomepage.dart';
import 'package:redux_async_ex/src/presentation/features/home/viewmodels/factory_viewmodel.dart';
import 'package:redux_async_ex/src/presentation/features/home/viewmodels/view_model.dart';

class MyHomePageConnector extends StatelessWidget {
  const MyHomePageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      vm: () => Factory(this),
      builder: (BuildContext context, ViewModel vm) => MyHomePage(
        counter: vm.counter,
        description: vm.description,
        onIncrement: vm.onIncrement,
        waiting: vm.waiting,
      ),
    );
  }
}
