import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:redux_async_ex/src/domain/entities/app_state.dart';
import 'package:redux_async_ex/src/domain/models/app_store.dart';
import 'package:redux_async_ex/src/myapp.dart';

void main() {
  final state = AppState.initialState();
  store = Store<AppState>(initialState: state);
  runApp(const MyApp());

}

