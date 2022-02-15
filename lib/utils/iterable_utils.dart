import 'dart:math' as math;

extension IterableExtension<T> on Iterable<T> {
  Iterable<T> distinctBy(dynamic selector(T input)) {
    final set = Set<dynamic>();
    return this.where((item) {
      final key = selector(item);
      return set.add(key);
    });
  }

  int sumOf(int selector(T input)) {
    int sum = 0;
    this.forEach((element) {
      sum += selector(element);
    });
    return sum;
  }
}

extension IterableNum<T extends num> on Iterable<T> {
  T get max => reduce(math.max);

  T get min => reduce(math.min);

  T get sum => reduce((a, b) => a + b as T);
}
