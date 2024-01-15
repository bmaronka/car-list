import 'dart:async';

mixin StreamMixin<T> {
  /// Not disposed because of its target is life in singleton
  // ignore: close_sinks
  final StreamController<T> _stream = StreamController.broadcast();

  void notifyStream(T value) => _stream.sink.add(value);

  Stream<T> getStream() => _stream.stream;
}
