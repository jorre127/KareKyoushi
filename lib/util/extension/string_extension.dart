extension StringExtension on String {
  String get filteredReading => replaceAll(RegExp(r'[.-]'), '').trim();
}
