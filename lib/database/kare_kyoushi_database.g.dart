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
  static const VerificationMeta _kunyomiMeta =
      const VerificationMeta('kunyomi');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> kunyomi =
      GeneratedColumn<String>('kunyomi', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($DbKanjiTableTable.$converterkunyomi);
  static const VerificationMeta _onyomiMeta = const VerificationMeta('onyomi');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> onyomi =
      GeneratedColumn<String>('onyomi', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($DbKanjiTableTable.$converteronyomi);
  static const VerificationMeta _meaningsMeta =
      const VerificationMeta('meanings');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> meanings =
      GeneratedColumn<String>('meanings', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($DbKanjiTableTable.$convertermeanings);
  static const VerificationMeta _jlptMeta = const VerificationMeta('jlpt');
  @override
  late final GeneratedColumnWithTypeConverter<Jlpt?, int> jlpt =
      GeneratedColumn<int>('jlpt', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<Jlpt?>($DbKanjiTableTable.$converterjlpt);
  static const VerificationMeta _gradeMeta = const VerificationMeta('grade');
  @override
  late final GeneratedColumn<int> grade = GeneratedColumn<int>(
      'grade', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _frequencyMeta =
      const VerificationMeta('frequency');
  @override
  late final GeneratedColumn<int> frequency = GeneratedColumn<int>(
      'frequency', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _knowledgeLevelMeta =
      const VerificationMeta('knowledgeLevel');
  @override
  late final GeneratedColumnWithTypeConverter<KnowledgeLevel?, int>
      knowledgeLevel = GeneratedColumn<int>(
              'knowledge_level', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<KnowledgeLevel?>(
              $DbKanjiTableTable.$converterknowledgeLevel);
  @override
  List<GeneratedColumn> get $columns => [
        kanjiValue,
        kunyomi,
        onyomi,
        meanings,
        jlpt,
        grade,
        frequency,
        knowledgeLevel
      ];
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
    context.handle(_kunyomiMeta, const VerificationResult.success());
    context.handle(_onyomiMeta, const VerificationResult.success());
    context.handle(_meaningsMeta, const VerificationResult.success());
    context.handle(_jlptMeta, const VerificationResult.success());
    if (data.containsKey('grade')) {
      context.handle(
          _gradeMeta, grade.isAcceptableOrUnknown(data['grade']!, _gradeMeta));
    }
    if (data.containsKey('frequency')) {
      context.handle(_frequencyMeta,
          frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta));
    }
    context.handle(_knowledgeLevelMeta, const VerificationResult.success());
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
      kunyomi: $DbKanjiTableTable.$converterkunyomi.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}kunyomi'])!),
      onyomi: $DbKanjiTableTable.$converteronyomi.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}onyomi'])!),
      meanings: $DbKanjiTableTable.$convertermeanings.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meanings'])!),
      jlpt: $DbKanjiTableTable.$converterjlpt.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}jlpt'])),
      grade: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}grade']),
      frequency: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}frequency']),
      knowledgeLevel: $DbKanjiTableTable.$converterknowledgeLevel.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.int, data['${effectivePrefix}knowledge_level'])),
    );
  }

  @override
  $DbKanjiTableTable createAlias(String alias) {
    return $DbKanjiTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterkunyomi =
      const ListConverter();
  static TypeConverter<List<String>, String> $converteronyomi =
      const ListConverter();
  static TypeConverter<List<String>, String> $convertermeanings =
      const ListConverter();
  static TypeConverter<Jlpt?, int?> $converterjlpt = const JlptTypeConverter();
  static TypeConverter<KnowledgeLevel?, int?> $converterknowledgeLevel =
      const KnowledgeLevelTypeConverter();
}

class DbKanji extends DataClass implements Insertable<DbKanji> {
  final String kanjiValue;
  final List<String> kunyomi;
  final List<String> onyomi;
  final List<String> meanings;
  final Jlpt? jlpt;
  final int? grade;
  final int? frequency;
  final KnowledgeLevel? knowledgeLevel;
  const DbKanji(
      {required this.kanjiValue,
      required this.kunyomi,
      required this.onyomi,
      required this.meanings,
      this.jlpt,
      this.grade,
      this.frequency,
      this.knowledgeLevel});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['kanji_value'] = Variable<String>(kanjiValue);
    {
      map['kunyomi'] =
          Variable<String>($DbKanjiTableTable.$converterkunyomi.toSql(kunyomi));
    }
    {
      map['onyomi'] =
          Variable<String>($DbKanjiTableTable.$converteronyomi.toSql(onyomi));
    }
    {
      map['meanings'] = Variable<String>(
          $DbKanjiTableTable.$convertermeanings.toSql(meanings));
    }
    if (!nullToAbsent || jlpt != null) {
      map['jlpt'] =
          Variable<int>($DbKanjiTableTable.$converterjlpt.toSql(jlpt));
    }
    if (!nullToAbsent || grade != null) {
      map['grade'] = Variable<int>(grade);
    }
    if (!nullToAbsent || frequency != null) {
      map['frequency'] = Variable<int>(frequency);
    }
    if (!nullToAbsent || knowledgeLevel != null) {
      map['knowledge_level'] = Variable<int>(
          $DbKanjiTableTable.$converterknowledgeLevel.toSql(knowledgeLevel));
    }
    return map;
  }

  DbKanjiTableCompanion toCompanion(bool nullToAbsent) {
    return DbKanjiTableCompanion(
      kanjiValue: Value(kanjiValue),
      kunyomi: Value(kunyomi),
      onyomi: Value(onyomi),
      meanings: Value(meanings),
      jlpt: jlpt == null && nullToAbsent ? const Value.absent() : Value(jlpt),
      grade:
          grade == null && nullToAbsent ? const Value.absent() : Value(grade),
      frequency: frequency == null && nullToAbsent
          ? const Value.absent()
          : Value(frequency),
      knowledgeLevel: knowledgeLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(knowledgeLevel),
    );
  }

  factory DbKanji.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbKanji(
      kanjiValue: serializer.fromJson<String>(json['kanjiValue']),
      kunyomi: serializer.fromJson<List<String>>(json['kunyomi']),
      onyomi: serializer.fromJson<List<String>>(json['onyomi']),
      meanings: serializer.fromJson<List<String>>(json['meanings']),
      jlpt: serializer.fromJson<Jlpt?>(json['jlpt']),
      grade: serializer.fromJson<int?>(json['grade']),
      frequency: serializer.fromJson<int?>(json['frequency']),
      knowledgeLevel:
          serializer.fromJson<KnowledgeLevel?>(json['knowledgeLevel']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'kanjiValue': serializer.toJson<String>(kanjiValue),
      'kunyomi': serializer.toJson<List<String>>(kunyomi),
      'onyomi': serializer.toJson<List<String>>(onyomi),
      'meanings': serializer.toJson<List<String>>(meanings),
      'jlpt': serializer.toJson<Jlpt?>(jlpt),
      'grade': serializer.toJson<int?>(grade),
      'frequency': serializer.toJson<int?>(frequency),
      'knowledgeLevel': serializer.toJson<KnowledgeLevel?>(knowledgeLevel),
    };
  }

  DbKanji copyWith(
          {String? kanjiValue,
          List<String>? kunyomi,
          List<String>? onyomi,
          List<String>? meanings,
          Value<Jlpt?> jlpt = const Value.absent(),
          Value<int?> grade = const Value.absent(),
          Value<int?> frequency = const Value.absent(),
          Value<KnowledgeLevel?> knowledgeLevel = const Value.absent()}) =>
      DbKanji(
        kanjiValue: kanjiValue ?? this.kanjiValue,
        kunyomi: kunyomi ?? this.kunyomi,
        onyomi: onyomi ?? this.onyomi,
        meanings: meanings ?? this.meanings,
        jlpt: jlpt.present ? jlpt.value : this.jlpt,
        grade: grade.present ? grade.value : this.grade,
        frequency: frequency.present ? frequency.value : this.frequency,
        knowledgeLevel:
            knowledgeLevel.present ? knowledgeLevel.value : this.knowledgeLevel,
      );
  @override
  String toString() {
    return (StringBuffer('DbKanji(')
          ..write('kanjiValue: $kanjiValue, ')
          ..write('kunyomi: $kunyomi, ')
          ..write('onyomi: $onyomi, ')
          ..write('meanings: $meanings, ')
          ..write('jlpt: $jlpt, ')
          ..write('grade: $grade, ')
          ..write('frequency: $frequency, ')
          ..write('knowledgeLevel: $knowledgeLevel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(kanjiValue, kunyomi, onyomi, meanings, jlpt,
      grade, frequency, knowledgeLevel);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbKanji &&
          other.kanjiValue == this.kanjiValue &&
          other.kunyomi == this.kunyomi &&
          other.onyomi == this.onyomi &&
          other.meanings == this.meanings &&
          other.jlpt == this.jlpt &&
          other.grade == this.grade &&
          other.frequency == this.frequency &&
          other.knowledgeLevel == this.knowledgeLevel);
}

class DbKanjiTableCompanion extends UpdateCompanion<DbKanji> {
  final Value<String> kanjiValue;
  final Value<List<String>> kunyomi;
  final Value<List<String>> onyomi;
  final Value<List<String>> meanings;
  final Value<Jlpt?> jlpt;
  final Value<int?> grade;
  final Value<int?> frequency;
  final Value<KnowledgeLevel?> knowledgeLevel;
  final Value<int> rowid;
  const DbKanjiTableCompanion({
    this.kanjiValue = const Value.absent(),
    this.kunyomi = const Value.absent(),
    this.onyomi = const Value.absent(),
    this.meanings = const Value.absent(),
    this.jlpt = const Value.absent(),
    this.grade = const Value.absent(),
    this.frequency = const Value.absent(),
    this.knowledgeLevel = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbKanjiTableCompanion.insert({
    required String kanjiValue,
    required List<String> kunyomi,
    required List<String> onyomi,
    required List<String> meanings,
    this.jlpt = const Value.absent(),
    this.grade = const Value.absent(),
    this.frequency = const Value.absent(),
    this.knowledgeLevel = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : kanjiValue = Value(kanjiValue),
        kunyomi = Value(kunyomi),
        onyomi = Value(onyomi),
        meanings = Value(meanings);
  static Insertable<DbKanji> custom({
    Expression<String>? kanjiValue,
    Expression<String>? kunyomi,
    Expression<String>? onyomi,
    Expression<String>? meanings,
    Expression<int>? jlpt,
    Expression<int>? grade,
    Expression<int>? frequency,
    Expression<int>? knowledgeLevel,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (kanjiValue != null) 'kanji_value': kanjiValue,
      if (kunyomi != null) 'kunyomi': kunyomi,
      if (onyomi != null) 'onyomi': onyomi,
      if (meanings != null) 'meanings': meanings,
      if (jlpt != null) 'jlpt': jlpt,
      if (grade != null) 'grade': grade,
      if (frequency != null) 'frequency': frequency,
      if (knowledgeLevel != null) 'knowledge_level': knowledgeLevel,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbKanjiTableCompanion copyWith(
      {Value<String>? kanjiValue,
      Value<List<String>>? kunyomi,
      Value<List<String>>? onyomi,
      Value<List<String>>? meanings,
      Value<Jlpt?>? jlpt,
      Value<int?>? grade,
      Value<int?>? frequency,
      Value<KnowledgeLevel?>? knowledgeLevel,
      Value<int>? rowid}) {
    return DbKanjiTableCompanion(
      kanjiValue: kanjiValue ?? this.kanjiValue,
      kunyomi: kunyomi ?? this.kunyomi,
      onyomi: onyomi ?? this.onyomi,
      meanings: meanings ?? this.meanings,
      jlpt: jlpt ?? this.jlpt,
      grade: grade ?? this.grade,
      frequency: frequency ?? this.frequency,
      knowledgeLevel: knowledgeLevel ?? this.knowledgeLevel,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (kanjiValue.present) {
      map['kanji_value'] = Variable<String>(kanjiValue.value);
    }
    if (kunyomi.present) {
      map['kunyomi'] = Variable<String>(
          $DbKanjiTableTable.$converterkunyomi.toSql(kunyomi.value));
    }
    if (onyomi.present) {
      map['onyomi'] = Variable<String>(
          $DbKanjiTableTable.$converteronyomi.toSql(onyomi.value));
    }
    if (meanings.present) {
      map['meanings'] = Variable<String>(
          $DbKanjiTableTable.$convertermeanings.toSql(meanings.value));
    }
    if (jlpt.present) {
      map['jlpt'] =
          Variable<int>($DbKanjiTableTable.$converterjlpt.toSql(jlpt.value));
    }
    if (grade.present) {
      map['grade'] = Variable<int>(grade.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<int>(frequency.value);
    }
    if (knowledgeLevel.present) {
      map['knowledge_level'] = Variable<int>($DbKanjiTableTable
          .$converterknowledgeLevel
          .toSql(knowledgeLevel.value));
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
          ..write('kunyomi: $kunyomi, ')
          ..write('onyomi: $onyomi, ')
          ..write('meanings: $meanings, ')
          ..write('jlpt: $jlpt, ')
          ..write('grade: $grade, ')
          ..write('frequency: $frequency, ')
          ..write('knowledgeLevel: $knowledgeLevel, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbWordTableTable extends DbWordTable
    with TableInfo<$DbWordTableTable, DbWord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbWordTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _readingMeta =
      const VerificationMeta('reading');
  @override
  late final GeneratedColumn<String> reading = GeneratedColumn<String>(
      'reading', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCommonMeta =
      const VerificationMeta('isCommon');
  @override
  late final GeneratedColumn<bool> isCommon = GeneratedColumn<bool>(
      'is_common', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_common" IN (0, 1))'));
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
      'priority', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _jlptMeta = const VerificationMeta('jlpt');
  @override
  late final GeneratedColumnWithTypeConverter<Jlpt?, int> jlpt =
      GeneratedColumn<int>('jlpt', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<Jlpt?>($DbWordTableTable.$converterjlpt);
  static const VerificationMeta _meaningEntriesMeta =
      const VerificationMeta('meaningEntries');
  @override
  late final GeneratedColumnWithTypeConverter<List<MeaningEntry>, String>
      meaningEntries = GeneratedColumn<String>(
              'meaning_entries', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<MeaningEntry>>(
              $DbWordTableTable.$convertermeaningEntries);
  @override
  List<GeneratedColumn> get $columns =>
      [id, value, reading, isCommon, priority, jlpt, meaningEntries];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_word_table';
  @override
  VerificationContext validateIntegrity(Insertable<DbWord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('reading')) {
      context.handle(_readingMeta,
          reading.isAcceptableOrUnknown(data['reading']!, _readingMeta));
    } else if (isInserting) {
      context.missing(_readingMeta);
    }
    if (data.containsKey('is_common')) {
      context.handle(_isCommonMeta,
          isCommon.isAcceptableOrUnknown(data['is_common']!, _isCommonMeta));
    } else if (isInserting) {
      context.missing(_isCommonMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    }
    context.handle(_jlptMeta, const VerificationResult.success());
    context.handle(_meaningEntriesMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbWord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbWord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      reading: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reading'])!,
      isCommon: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_common'])!,
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}priority']),
      jlpt: $DbWordTableTable.$converterjlpt.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}jlpt'])),
      meaningEntries: $DbWordTableTable.$convertermeaningEntries.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}meaning_entries'])!),
    );
  }

  @override
  $DbWordTableTable createAlias(String alias) {
    return $DbWordTableTable(attachedDatabase, alias);
  }

  static TypeConverter<Jlpt?, int?> $converterjlpt = const JlptTypeConverter();
  static TypeConverter<List<MeaningEntry>, String> $convertermeaningEntries =
      const ListConverter(callback: MeaningEntry.fromJson);
}

class DbWord extends DataClass implements Insertable<DbWord> {
  final String id;
  final String value;
  final String reading;
  final bool isCommon;
  final int? priority;
  final Jlpt? jlpt;
  final List<MeaningEntry> meaningEntries;
  const DbWord(
      {required this.id,
      required this.value,
      required this.reading,
      required this.isCommon,
      this.priority,
      this.jlpt,
      required this.meaningEntries});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['value'] = Variable<String>(value);
    map['reading'] = Variable<String>(reading);
    map['is_common'] = Variable<bool>(isCommon);
    if (!nullToAbsent || priority != null) {
      map['priority'] = Variable<int>(priority);
    }
    if (!nullToAbsent || jlpt != null) {
      map['jlpt'] = Variable<int>($DbWordTableTable.$converterjlpt.toSql(jlpt));
    }
    {
      map['meaning_entries'] = Variable<String>(
          $DbWordTableTable.$convertermeaningEntries.toSql(meaningEntries));
    }
    return map;
  }

  DbWordTableCompanion toCompanion(bool nullToAbsent) {
    return DbWordTableCompanion(
      id: Value(id),
      value: Value(value),
      reading: Value(reading),
      isCommon: Value(isCommon),
      priority: priority == null && nullToAbsent
          ? const Value.absent()
          : Value(priority),
      jlpt: jlpt == null && nullToAbsent ? const Value.absent() : Value(jlpt),
      meaningEntries: Value(meaningEntries),
    );
  }

  factory DbWord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbWord(
      id: serializer.fromJson<String>(json['id']),
      value: serializer.fromJson<String>(json['value']),
      reading: serializer.fromJson<String>(json['reading']),
      isCommon: serializer.fromJson<bool>(json['isCommon']),
      priority: serializer.fromJson<int?>(json['priority']),
      jlpt: serializer.fromJson<Jlpt?>(json['jlpt']),
      meaningEntries:
          serializer.fromJson<List<MeaningEntry>>(json['meaningEntries']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'value': serializer.toJson<String>(value),
      'reading': serializer.toJson<String>(reading),
      'isCommon': serializer.toJson<bool>(isCommon),
      'priority': serializer.toJson<int?>(priority),
      'jlpt': serializer.toJson<Jlpt?>(jlpt),
      'meaningEntries': serializer.toJson<List<MeaningEntry>>(meaningEntries),
    };
  }

  DbWord copyWith(
          {String? id,
          String? value,
          String? reading,
          bool? isCommon,
          Value<int?> priority = const Value.absent(),
          Value<Jlpt?> jlpt = const Value.absent(),
          List<MeaningEntry>? meaningEntries}) =>
      DbWord(
        id: id ?? this.id,
        value: value ?? this.value,
        reading: reading ?? this.reading,
        isCommon: isCommon ?? this.isCommon,
        priority: priority.present ? priority.value : this.priority,
        jlpt: jlpt.present ? jlpt.value : this.jlpt,
        meaningEntries: meaningEntries ?? this.meaningEntries,
      );
  @override
  String toString() {
    return (StringBuffer('DbWord(')
          ..write('id: $id, ')
          ..write('value: $value, ')
          ..write('reading: $reading, ')
          ..write('isCommon: $isCommon, ')
          ..write('priority: $priority, ')
          ..write('jlpt: $jlpt, ')
          ..write('meaningEntries: $meaningEntries')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, value, reading, isCommon, priority, jlpt, meaningEntries);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbWord &&
          other.id == this.id &&
          other.value == this.value &&
          other.reading == this.reading &&
          other.isCommon == this.isCommon &&
          other.priority == this.priority &&
          other.jlpt == this.jlpt &&
          other.meaningEntries == this.meaningEntries);
}

class DbWordTableCompanion extends UpdateCompanion<DbWord> {
  final Value<String> id;
  final Value<String> value;
  final Value<String> reading;
  final Value<bool> isCommon;
  final Value<int?> priority;
  final Value<Jlpt?> jlpt;
  final Value<List<MeaningEntry>> meaningEntries;
  final Value<int> rowid;
  const DbWordTableCompanion({
    this.id = const Value.absent(),
    this.value = const Value.absent(),
    this.reading = const Value.absent(),
    this.isCommon = const Value.absent(),
    this.priority = const Value.absent(),
    this.jlpt = const Value.absent(),
    this.meaningEntries = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbWordTableCompanion.insert({
    required String id,
    required String value,
    required String reading,
    required bool isCommon,
    this.priority = const Value.absent(),
    this.jlpt = const Value.absent(),
    required List<MeaningEntry> meaningEntries,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        value = Value(value),
        reading = Value(reading),
        isCommon = Value(isCommon),
        meaningEntries = Value(meaningEntries);
  static Insertable<DbWord> custom({
    Expression<String>? id,
    Expression<String>? value,
    Expression<String>? reading,
    Expression<bool>? isCommon,
    Expression<int>? priority,
    Expression<int>? jlpt,
    Expression<String>? meaningEntries,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (value != null) 'value': value,
      if (reading != null) 'reading': reading,
      if (isCommon != null) 'is_common': isCommon,
      if (priority != null) 'priority': priority,
      if (jlpt != null) 'jlpt': jlpt,
      if (meaningEntries != null) 'meaning_entries': meaningEntries,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbWordTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? value,
      Value<String>? reading,
      Value<bool>? isCommon,
      Value<int?>? priority,
      Value<Jlpt?>? jlpt,
      Value<List<MeaningEntry>>? meaningEntries,
      Value<int>? rowid}) {
    return DbWordTableCompanion(
      id: id ?? this.id,
      value: value ?? this.value,
      reading: reading ?? this.reading,
      isCommon: isCommon ?? this.isCommon,
      priority: priority ?? this.priority,
      jlpt: jlpt ?? this.jlpt,
      meaningEntries: meaningEntries ?? this.meaningEntries,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (reading.present) {
      map['reading'] = Variable<String>(reading.value);
    }
    if (isCommon.present) {
      map['is_common'] = Variable<bool>(isCommon.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (jlpt.present) {
      map['jlpt'] =
          Variable<int>($DbWordTableTable.$converterjlpt.toSql(jlpt.value));
    }
    if (meaningEntries.present) {
      map['meaning_entries'] = Variable<String>($DbWordTableTable
          .$convertermeaningEntries
          .toSql(meaningEntries.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbWordTableCompanion(')
          ..write('id: $id, ')
          ..write('value: $value, ')
          ..write('reading: $reading, ')
          ..write('isCommon: $isCommon, ')
          ..write('priority: $priority, ')
          ..write('jlpt: $jlpt, ')
          ..write('meaningEntries: $meaningEntries, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$KKDatabase extends GeneratedDatabase {
  _$KKDatabase(QueryExecutor e) : super(e);
  late final $DbKanjiTableTable dbKanjiTable = $DbKanjiTableTable(this);
  late final $DbWordTableTable dbWordTable = $DbWordTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [dbKanjiTable, dbWordTable];
}
