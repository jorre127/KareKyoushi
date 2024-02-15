import 'dart:convert';

import 'package:drift/drift.dart';

class ListConverter<T> extends TypeConverter<List<T>, String> {
  final T Function(Map<String, dynamic> data)? callback;

  const ListConverter({this.callback});

  @override
  List<T> fromSql(String fromDb) {
    final List<dynamic> result = jsonDecode(fromDb) as List<dynamic>;
    return result.map((item) {
      if (item is Map<String, dynamic>) {
        if (callback == null) throw ArgumentError('Callback is null');
        return callback!(item);
      }
      return item as T;
    }).toList();
  }

  @override
  String toSql(List<T> value) => json.encode(value);
}
