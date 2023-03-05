extension ListFromMap<Key, Element> on Map<Key, Element> {
  List<T> toList<T>(
      T Function(MapEntry<Key, Element> entry) getElement) =>
      entries.map(getElement).toList();
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}