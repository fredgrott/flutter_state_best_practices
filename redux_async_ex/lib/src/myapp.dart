// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:redux_async_ex/src/domain/entities/app_state.dart';
import 'package:redux_async_ex/src/domain/entities/app_store.dart';
import 'package:redux_async_ex/src/presentation/features/home/ui/homepage_connector.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreProvider<AppState>(
      store: store,
      child: const MaterialApp(
        home: MyHomePageConnector(),
      ),);
}
