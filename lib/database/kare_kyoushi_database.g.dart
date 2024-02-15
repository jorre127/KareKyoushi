// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kare_kyoushi_database.dart';

// ignore_for_file: type=lint
class $DbKanjiTableTable extends DbKanjiTable
    with TableInfo<$DbKanjiTableTable, DbKanji> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbKanjiTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _kanjiValueMeta =
      const VerificationMeta('kanjiValue');
  @override
  late final GeneratedColumn<String> kanjiValue = GeneratedColumn<String>(
      'kanji_value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _jlptMeta = const VerificationMeta('jlpt');
  @override
  late final GeneratedColumnWithTypeConverter<Jlpt?, int> jlpt =
      GeneratedColumn<int>('jlpt', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<Jlpt?>($DbKanjiTableTable.$converterjlpt);
  @override
  List<GeneratedColumn> get $columns => [kanjiValue, jlpt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_kanji_table';
  @override
  VerificationContext validateIntegrity(Insertable<DbKanji> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('kanji_value')) {
      context.handle(
          _kanjiValueMeta,
          kanjiValue.isAcceptableOrUnknown(
              data['kanji_value']!, _kanjiValueMeta));
    } else if (isInserting) {
      context.missing(_kanjiValueMeta);
    }
    context.handle(_jlptMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {kanjiValue};
  @override
  DbKanji map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbKanji(
      kanjiValue: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}kanji_value'])!,
      jlpt: $DbKanjiTableTable.$converterjlpt.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}jlpt'])),
    );
  }

  @override
  $DbKanjiTableTable createAlias(String alias) {
    return $DbKanjiTableTable(attachedDatabase, alias);
  }

  static TypeConverter<Jlpt?, int?> $converterjlpt = const JlptTypeConverter();
}

class DbKanji extends DataClass implements Insertable<DbKanji> {
  final String kanjiValue;
  final Jlpt? jlpt;
  const DbKanji({required this.kanjiValue, this.jlpt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['kanji_value'] = Variable<String>(kanjiValue);
    if (!nullToAbsent || jlpt != null) {
      map['jlpt'] =
          Variable<int>($DbKanjiTableTable.$converterjlpt.toSql(jlpt));
    }
    return map;
  }

  DbKanjiTableCompanion toCompanion(bool nullToAbsent) {
    return DbKanjiTableCompanion(
      kanjiValue: Value(kanjiValue),
      jlpt: jlpt == null && nullToAbsent ? const Value.absent() : Value(jlpt),
    );
  }

  factory DbKanji.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbKanji(
      kanjiValue: serializer.fromJson<String>(json['kanjiValue']),
      jlpt: serializer.fromJson<Jlpt?>(json['jlpt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'kanjiValue': serializer.toJson<String>(kanjiValue),
      'jlpt': serializer.toJson<Jlpt?>(jlpt),
    };
  }

  DbKanji copyWith(
          {String? kanjiValue, Value<Jlpt?> jlpt = const Value.absent()}) =>
      DbKanji(
        kanjiValue: kanjiValue ?? this.kanjiValue,
        jlpt: jlpt.present ? jlpt.value : this.jlpt,
      );
  @override
  String toString() {
    return (StringBuffer('DbKanji(')
          ..write('kanjiValue: $kanjiValue, ')
          ..write('jlpt: $jlpt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(kanjiValue, jlpt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbKanji &&
          other.kanjiValue == this.kanjiValue &&
          other.jlpt == this.jlpt);
}

class DbKanjiTableCompanion extends UpdateCompanion<DbKanji> {
  final Value<String> kanjiValue;
  final Value<Jlpt?> jlpt;
  final Value<int> rowid;
  const DbKanjiTableCompanion({
    this.kanjiValue = const Value.absent(),
    this.jlpt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbKanjiTableCompanion.insert({
    required String kanjiValue,
    this.jlpt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : kanjiValue = Value(kanjiValue);
  static Insertable<DbKanji> custom({
    Expression<String>? kanjiValue,
    Expression<int>? jlpt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (kanjiValue != null) 'kanji_value': kanjiValue,
      if (jlpt != null) 'jlpt': jlpt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbKanjiTableCompanion copyWith(
      {Value<String>? kanjiValue, Value<Jlpt?>? jlpt, Value<int>? rowid}) {
    return DbKanjiTableCompanion(
      kanjiValue: kanjiValue ?? this.kanjiValue,
      jlpt: jlpt ?? this.jlpt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (kanjiValue.present) {
      map['kanji_value'] = Variable<String>(kanjiValue.value);
    }
    if (jlpt.present) {
      map['jlpt'] =
          Variable<int>($DbKanjiTableTable.$converterjlpt.toSql(jlpt.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbKanjiTableCompanion(')
          ..write('kanjiValue: $kanjiValue, ')
          ..write('jlpt: $jlpt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$KKDatabase extends GeneratedDatabase {
  _$KKDatabase(QueryExecutor e) : super(e);
  late final $DbKanjiTableTable dbKanjiTable = $DbKanjiTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dbKanjiTable];
}
