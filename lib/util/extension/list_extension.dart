extension ListExtension<T> on List<T> {
  void sortByX(
    List<Comparable<dynamic>? Function(T item)> comparisons, {
    bool ascending = true,
  }) {
    sort((a, b) {
      int result = 0;
      for (final sorter in comparisons) {
        final byA = sorter(a);
        final byB = sorter(b);
        if (byA == null && byB != null) return ascending ? -1 : 1;
        if (byB == null && byA != null) return ascending ? 1 : -1;
        if (byA != null && byB != null) {
          result = _compareValues(byA, byB, ascending);
          if (result != 0) return result;
        }
      }
      return result;
    });
  }

  int _compareValues<A extends Comparable<dynamic>>(A a, A b, bool ascending) {
    if (identical(a, b)) return 0;
    if (ascending) return a.compareTo(b);
    return -a.compareTo(b);
  }
}
