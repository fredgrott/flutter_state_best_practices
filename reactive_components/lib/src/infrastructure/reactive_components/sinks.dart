// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

/// A Sink with [call] method for shorthand notation.
abstract class VoidSink extends Sink<void> {
  /// Adds null to the sink.
  void call() {
    add(null);
  }
}
