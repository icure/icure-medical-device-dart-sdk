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
