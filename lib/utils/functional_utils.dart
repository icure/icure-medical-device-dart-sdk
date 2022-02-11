// @dart=2.12

extension ObjectExt<T> on T {
  R let<R>(R Function(T that) op) => op(this);
  T also(void Function(T that) op) {
    op(this);
    return this;
  }
}

extension StringExt on String {
  bool get isUuid => RegExp(r'^[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}$').hasMatch(this);
}
