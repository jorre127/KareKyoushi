extension StringExtension on String {
  String get filteredReading => replaceAll('.', '').trim();
}
