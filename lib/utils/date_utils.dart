extension FuzzyDateTime on DateTime {
  int toFuzzy() {
    return this.year * 10000 + this.month * 100 + this.day;
  }
}
