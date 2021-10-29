import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart' show mustCallSuper;

typedef ListenerCallback<T> = void Function(T);

class _ListenerEntry<T> extends LinkedListEntry<_ListenerEntry<T>> {
  _ListenerEntry(this.listener);
  final ListenerCallback<T> listener;
}

abstract class BaseBloC<T> {
  LinkedList<_ListenerEntry<T>> _listeners = LinkedList<_ListenerEntry<T>>();

  void onInit();

  void onReady();

  /// Tell us if the controller was disposed
  bool get disposed => _listeners == null;

  bool get hasListeners => _listeners.isNotEmpty;

  /// check if the controller is mounted
  void _debugAssertNotDisposed() {
    assert(_listeners != null, 'A $runtimeType was used after being disposed.');
  }

  /// add a new listener
  void addListener(ListenerCallback<T> listener) {
    _debugAssertNotDisposed();
    _listeners.add(_ListenerEntry<T>(listener));
  }

  /// remove a listener
  void removeListener(VoidCallback listener) {
    _debugAssertNotDisposed();
    for (final _ListenerEntry entry in _listeners) {
      if (entry.listener == listener) {
        entry.unlink();
        return;
      }
    }
  }

  void notifyListeners() {
    // assert(_debugAssertNotDisposed());
    if (_listeners.isEmpty) return;

    final List<_ListenerEntry> localListeners =
        List<_ListenerEntry>.from(_listeners);

    for (final _ListenerEntry entry in localListeners) {
      try {
        if (entry.list != null) _ListenerEntry<T>(entry.listener);
      } catch (exception, stack) {
        FlutterError.reportError(FlutterErrorDetails(
          exception: exception,
          stack: stack,
          library: 'foundation library',
          context: ErrorDescription(
              'while dispatching notifications for $runtimeType'),
          informationCollector: () sync* {
            yield DiagnosticsProperty<BaseBloC>(
              'The $runtimeType sending notification was',
              this,
              style: DiagnosticsTreeStyle.errorProperty,
            );
          },
        ));
      }
    }
  }

  /// use to listen when the BloC was deleted from memory
  @mustCallSuper
  void onDispose() async {
    _debugAssertNotDisposed();
    _listeners.clear();
    _listeners = null;
  }
}
