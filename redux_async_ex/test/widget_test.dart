// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:async_redux/async_redux.dart';

import 'package:flutter_test/flutter_test.dart';


import 'package:redux_async_ex/src/domain/entities/app_state.dart';
import 'package:redux_async_ex/src/presentation/features/home/viewcontrollers/barrier_action.dart';
import 'package:redux_async_ex/src/presentation/features/home/viewcontrollers/increment_action.dart';

// ignore: long-method
void main() {
  group("Counter tests", () {

    test('Initial state.', () {
      //
      final storeTester =
          StoreTester<AppState>(initialState: AppState.initialState());

      expect(storeTester.state.counter, 0);
      expect(storeTester.state.description, "");
      expect(storeTester.state.waiting, false);
    });

    test('Increment counter.', () async {
      //
      final storeTester =
          StoreTester<AppState>(initialState: AppState.initialState());
      expect(storeTester.state.counter, 0);

      storeTester.dispatch(IncrementAction(amount: 1));
      TestInfo<AppState> info = await storeTester.wait(IncrementAction);
      expect(info.state.counter, 1);

      storeTester.dispatch(IncrementAction(amount: 5));
      info = await storeTester.wait(IncrementAction);
      expect(info.state.counter, 6);
    });

    test('Increment counter and download description.', () async {
      //
      final storeTester =
          StoreTester<AppState>(initialState: AppState.initialState());
      expect(storeTester.state.counter, 0);
      expect(storeTester.state.description, isEmpty);

      storeTester.dispatch(IncrementAndGetDescriptionAction());

      final TestInfo<AppState> info =
          await storeTester.waitUntil(IncrementAndGetDescriptionAction);
      expect(info.state.counter, 1);
      expect(info.state.description, isNotEmpty);
    });

    test('Turn on/off the modal barrier.', () async {
      //
      final storeTester =
          StoreTester<AppState>(initialState: AppState.initialState());
      expect(storeTester.state.waiting, false);

      storeTester.dispatch(BarrierAction(true));
      TestInfo<AppState> info = await storeTester.wait(BarrierAction);
      expect(info.state.waiting, true);

      storeTester.dispatch(BarrierAction(false));
      info = await storeTester.wait(BarrierAction);
      expect(info.state.waiting, false);
    });

    test('Modal barrier exists while downloading description.', () async {
      //
      final storeTester =
          StoreTester<AppState>(initialState: AppState.initialState());
      expect(storeTester.state.counter, 0);
      expect(storeTester.state.description, isEmpty);

      storeTester.dispatch(IncrementAndGetDescriptionAction());

      final TestInfoList<AppState> infos = await storeTester.waitAll([
        IncrementAndGetDescriptionAction,
        BarrierAction,
        IncrementAction,
        BarrierAction,
      ]);

      // Modal barrier is turned on (first time BarrierAction is dispatched).
      var info = infos.get(BarrierAction, 1)!;
      expect(info.state.waiting, true);
      expect(info.state.description, isEmpty);
      expect(info.state.counter, 0);

      // While the counter was incremented the barrier was on.
      info = infos[IncrementAction]!;
      expect(info.state.counter, 1);
      expect(info.state.waiting, true);

      // Then the modal barrier is dismissed (second time BarrierAction is dispatched).
      info = infos.get(BarrierAction, 2)!;
      expect(info.state.waiting, false);
      expect(info.state.description, isNotEmpty);
      expect(info.state.counter, 1);

      // In the end, counter is incremented, description is created, and barrier is dismissed.
      info = infos[IncrementAndGetDescriptionAction]!;
      expect(info.state.waiting, false);
      expect(info.state.description, isNotEmpty);
      expect(info.state.counter, 1);
    });







  });
  
}
