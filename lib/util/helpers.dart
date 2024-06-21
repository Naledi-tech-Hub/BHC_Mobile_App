
int indexToBarChartColor(int index) {
  return switch (index) {
    0 || 1 => 2,
    2 || 3 || 4 => 1,
    _ => 0,
  };
}


extension RemoveNull on Map<String, dynamic> {
  void removeNull() => removeWhere((key, value) => value == null);
}

extension DoubleExtensions on num {
  String to2dp() => toStringAsFixed(2);
}
