// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kare_kyoushi_database.dart';

// ignore_for_file: type=lint
class $DbCharacterTableTable extends DbCharacterTable
    with TableInfo<$DbCharacterTableTable, DbCharacter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbCharacterTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _kunyomiMeta =
      const VerificationMeta('kunyomi');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> kunyomi =
      GeneratedColumn<String>('kunyomi', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>(
              $DbCharacterTableTable.$converterkunyomi);
  static const VerificationMeta _onyomiMeta = const VerificationMeta('onyomi');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> onyomi =
      GeneratedColumn<String>('onyomi', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($DbCharacterTableTable.$converteronyomi);
  static const VerificationMeta _meaningsMeta =
      const VerificationMeta('meanings');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> meanings =
      GeneratedColumn<String>('meanings', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>(
              $DbCharacterTableTable.$convertermeanings);
  static const VerificationMeta _difficultyGradeMeta =
      const VerificationMeta('difficultyGrade');
  @override
  late final GeneratedColumnWithTypeConverter<DifficultyGrade?, int>
      difficultyGrade = GeneratedColumn<int>(
              'difficulty_grade', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<DifficultyGrade?>(
              $DbCharacterTableTable.$converterdifficultyGrade);
  static const VerificationMeta _alphbabetMeta =
      const VerificationMeta('alphbabet');
  @override
  late final GeneratedColumnWithTypeConverter<Alphabet, String> alphbabet =
      GeneratedColumn<String>('alphbabet', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Alphabet>($DbCharacterTableTable.$converteralphbabet);
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
              $DbCharacterTableTable.$converterknowledgeLevel);
  @override
  List<GeneratedColumn> get $columns => [
        value,
        kunyomi,
        onyomi,
        meanings,
        difficultyGrade,
        alphbabet,
        grade,
        frequency,
        knowledgeLevel
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_character_table';
  @override
  VerificationContext validateIntegrity(Insertable<DbCharacter> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    context.handle(_kunyomiMeta, const VerificationResult.success());
    context.handle(_onyomiMeta, const VerificationResult.success());
    context.handle(_meaningsMeta, const VerificationResult.success());
    context.handle(_difficultyGradeMeta, const VerificationResult.success());
    context.handle(_alphbabetMeta, const VerificationResult.success());
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
  Set<GeneratedColumn> get $primaryKey => {value};
  @override
  DbCharacter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbCharacter(
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      kunyomi: $DbCharacterTableTable.$converterkunyomi.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}kunyomi'])!),
      onyomi: $DbCharacterTableTable.$converteronyomi.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}onyomi'])!),
      meanings: $DbCharacterTableTable.$convertermeanings.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}meanings'])!),
      difficultyGrade: $DbCharacterTableTable.$converterdifficultyGrade.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.int, data['${effectivePrefix}difficulty_grade'])),
      alphbabet: $DbCharacterTableTable.$converteralphbabet.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}alphbabet'])!),
      grade: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}grade']),
      frequency: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}frequency']),
      knowledgeLevel: $DbCharacterTableTable.$converterknowledgeLevel.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.int, data['${effectivePrefix}knowledge_level'])),
    );
  }

  @override
  $DbCharacterTableTable createAlias(String alias) {
    return $DbCharacterTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterkunyomi =
      const ListConverter();
  static TypeConverter<List<String>, String> $converteronyomi =
      const ListConverter();
  static TypeConverter<List<String>, String> $convertermeanings =
      const ListConverter();
  static TypeConverter<DifficultyGrade?, int?> $converterdifficultyGrade =
      const DifficultyGradeTypeConverter();
  static TypeConverter<Alphabet, String> $converteralphbabet =
      const AlphabetTypeConverter();
  static TypeConverter<KnowledgeLevel?, int?> $converterknowledgeLevel =
      const KnowledgeLevelTypeConverter();
}

class DbCharacter extends DataClass implements Insertable<DbCharacter> {
  final String value;
  final List<String> kunyomi;
  final List<String> onyomi;
  final List<String> meanings;
  final DifficultyGrade? difficultyGrade;
  final Alphabet alphbabet;
  final int? grade;
  final int? frequency;
  final KnowledgeLevel? knowledgeLevel;
  const DbCharacter(
      {required this.value,
      required this.kunyomi,
      required this.onyomi,
      required this.meanings,
      this.difficultyGrade,
      required this.alphbabet,
      this.grade,
      this.frequency,
      this.knowledgeLevel});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['value'] = Variable<String>(value);
    {
      map['kunyomi'] = Variable<String>(
          $DbCharacterTableTable.$converterkunyomi.toSql(kunyomi));
    }
    {
      map['onyomi'] = Variable<String>(
          $DbCharacterTableTable.$converteronyomi.toSql(onyomi));
    }
    {
      map['meanings'] = Variable<String>(
          $DbCharacterTableTable.$convertermeanings.toSql(meanings));
    }
    if (!nullToAbsent || difficultyGrade != null) {
      map['difficulty_grade'] = Variable<int>($DbCharacterTableTable
          .$converterdifficultyGrade
          .toSql(difficultyGrade));
    }
    {
      map['alphbabet'] = Variable<String>(
          $DbCharacterTableTable.$converteralphbabet.toSql(alphbabet));
    }
    if (!nullToAbsent || grade != null) {
      map['grade'] = Variable<int>(grade);
    }
    if (!nullToAbsent || frequency != null) {
      map['frequency'] = Variable<int>(frequency);
    }
    if (!nullToAbsent || knowledgeLevel != null) {
      map['knowledge_level'] = Variable<int>($DbCharacterTableTable
          .$converterknowledgeLevel
          .toSql(knowledgeLevel));
    }
    return map;
  }

  DbCharacterTableCompanion toCompanion(bool nullToAbsent) {
    return DbCharacterTableCompanion(
      value: Value(value),
      kunyomi: Value(kunyomi),
      onyomi: Value(onyomi),
      meanings: Value(meanings),
      difficultyGrade: difficultyGrade == null && nullToAbsent
          ? const Value.absent()
          : Value(difficultyGrade),
      alphbabet: Value(alphbabet),
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

  factory DbCharacter.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbCharacter(
      value: serializer.fromJson<String>(json['value']),
      kunyomi: serializer.fromJson<List<String>>(json['kunyomi']),
      onyomi: serializer.fromJson<List<String>>(json['onyomi']),
      meanings: serializer.fromJson<List<String>>(json['meanings']),
      difficultyGrade:
          serializer.fromJson<DifficultyGrade?>(json['difficultyGrade']),
      alphbabet: serializer.fromJson<Alphabet>(json['alphbabet']),
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
      'value': serializer.toJson<String>(value),
      'kunyomi': serializer.toJson<List<String>>(kunyomi),
      'onyomi': serializer.toJson<List<String>>(onyomi),
      'meanings': serializer.toJson<List<String>>(meanings),
      'difficultyGrade': serializer.toJson<DifficultyGrade?>(difficultyGrade),
      'alphbabet': serializer.toJson<Alphabet>(alphbabet),
      'grade': serializer.toJson<int?>(grade),
      'frequency': serializer.toJson<int?>(frequency),
      'knowledgeLevel': serializer.toJson<KnowledgeLevel?>(knowledgeLevel),
    };
  }

  DbCharacter copyWith(
          {String? value,
          List<String>? kunyomi,
          List<String>? onyomi,
          List<String>? meanings,
          Value<DifficultyGrade?> difficultyGrade = const Value.absent(),
          Alphabet? alphbabet,
          Value<int?> grade = const Value.absent(),
          Value<int?> frequency = const Value.absent(),
          Value<KnowledgeLevel?> knowledgeLevel = const Value.absent()}) =>
      DbCharacter(
        value: value ?? this.value,
        kunyomi: kunyomi ?? this.kunyomi,
        onyomi: onyomi ?? this.onyomi,
        meanings: meanings ?? this.meanings,
        difficultyGrade: difficultyGrade.present
            ? difficultyGrade.value
            : this.difficultyGrade,
        alphbabet: alphbabet ?? this.alphbabet,
        grade: grade.present ? grade.value : this.grade,
        frequency: frequency.present ? frequency.value : this.frequency,
        knowledgeLevel:
            knowledgeLevel.present ? knowledgeLevel.value : this.knowledgeLevel,
      );
  @override
  String toString() {
    return (StringBuffer('DbCharacter(')
          ..write('value: $value, ')
          ..write('kunyomi: $kunyomi, ')
          ..write('onyomi: $onyomi, ')
          ..write('meanings: $meanings, ')
          ..write('difficultyGrade: $difficultyGrade, ')
          ..write('alphbabet: $alphbabet, ')
          ..write('grade: $grade, ')
          ..write('frequency: $frequency, ')
          ..write('knowledgeLevel: $knowledgeLevel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(value, kunyomi, onyomi, meanings,
      difficultyGrade, alphbabet, grade, frequency, knowledgeLevel);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbCharacter &&
          other.value == this.value &&
          other.kunyomi == this.kunyomi &&
          other.onyomi == this.onyomi &&
          other.meanings == this.meanings &&
          other.difficultyGrade == this.difficultyGrade &&
          other.alphbabet == this.alphbabet &&
          other.grade == this.grade &&
          other.frequency == this.frequency &&
          other.knowledgeLevel == this.knowledgeLevel);
}

class DbCharacterTableCompanion extends UpdateCompanion<DbCharacter> {
  final Value<String> value;
  final Value<List<String>> kunyomi;
  final Value<List<String>> onyomi;
  final Value<List<String>> meanings;
  final Value<DifficultyGrade?> difficultyGrade;
  final Value<Alphabet> alphbabet;
  final Value<int?> grade;
  final Value<int?> frequency;
  final Value<KnowledgeLevel?> knowledgeLevel;
  final Value<int> rowid;
  const DbCharacterTableCompanion({
    this.value = const Value.absent(),
    this.kunyomi = const Value.absent(),
    this.onyomi = const Value.absent(),
    this.meanings = const Value.absent(),
    this.difficultyGrade = const Value.absent(),
    this.alphbabet = const Value.absent(),
    this.grade = const Value.absent(),
    this.frequency = const Value.absent(),
    this.knowledgeLevel = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbCharacterTableCompanion.insert({
    required String value,
    required List<String> kunyomi,
    required List<String> onyomi,
    required List<String> meanings,
    this.difficultyGrade = const Value.absent(),
    required Alphabet alphbabet,
    this.grade = const Value.absent(),
    this.frequency = const Value.absent(),
    this.knowledgeLevel = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : value = Value(value),
        kunyomi = Value(kunyomi),
        onyomi = Value(onyomi),
        meanings = Value(meanings),
        alphbabet = Value(alphbabet);
  static Insertable<DbCharacter> custom({
    Expression<String>? value,
    Expression<String>? kunyomi,
    Expression<String>? onyomi,
    Expression<String>? meanings,
    Expression<int>? difficultyGrade,
    Expression<String>? alphbabet,
    Expression<int>? grade,
    Expression<int>? frequency,
    Expression<int>? knowledgeLevel,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (value != null) 'value': value,
      if (kunyomi != null) 'kunyomi': kunyomi,
      if (onyomi != null) 'onyomi': onyomi,
      if (meanings != null) 'meanings': meanings,
      if (difficultyGrade != null) 'difficulty_grade': difficultyGrade,
      if (alphbabet != null) 'alphbabet': alphbabet,
      if (grade != null) 'grade': grade,
      if (frequency != null) 'frequency': frequency,
      if (knowledgeLevel != null) 'knowledge_level': knowledgeLevel,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbCharacterTableCompanion copyWith(
      {Value<String>? value,
      Value<List<String>>? kunyomi,
      Value<List<String>>? onyomi,
      Value<List<String>>? meanings,
      Value<DifficultyGrade?>? difficultyGrade,
      Value<Alphabet>? alphbabet,
      Value<int?>? grade,
      Value<int?>? frequency,
      Value<KnowledgeLevel?>? knowledgeLevel,
      Value<int>? rowid}) {
    return DbCharacterTableCompanion(
      value: value ?? this.value,
      kunyomi: kunyomi ?? this.kunyomi,
      onyomi: onyomi ?? this.onyomi,
      meanings: meanings ?? this.meanings,
      difficultyGrade: difficultyGrade ?? this.difficultyGrade,
      alphbabet: alphbabet ?? this.alphbabet,
      grade: grade ?? this.grade,
      frequency: frequency ?? this.frequency,
      knowledgeLevel: knowledgeLevel ?? this.knowledgeLevel,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (kunyomi.present) {
      map['kunyomi'] = Variable<String>(
          $DbCharacterTableTable.$converterkunyomi.toSql(kunyomi.value));
    }
    if (onyomi.present) {
      map['onyomi'] = Variable<String>(
          $DbCharacterTableTable.$converteronyomi.toSql(onyomi.value));
    }
    if (meanings.present) {
      map['meanings'] = Variable<String>(
          $DbCharacterTableTable.$convertermeanings.toSql(meanings.value));
    }
    if (difficultyGrade.present) {
      map['difficulty_grade'] = Variable<int>($DbCharacterTableTable
          .$converterdifficultyGrade
          .toSql(difficultyGrade.value));
    }
    if (alphbabet.present) {
      map['alphbabet'] = Variable<String>(
          $DbCharacterTableTable.$converteralphbabet.toSql(alphbabet.value));
    }
    if (grade.present) {
      map['grade'] = Variable<int>(grade.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<int>(frequency.value);
    }
    if (knowledgeLevel.present) {
      map['knowledge_level'] = Variable<int>($DbCharacterTableTable
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
    return (StringBuffer('DbCharacterTableCompanion(')
          ..write('value: $value, ')
          ..write('kunyomi: $kunyomi, ')
          ..write('onyomi: $onyomi, ')
          ..write('meanings: $meanings, ')
          ..write('difficultyGrade: $difficultyGrade, ')
          ..write('alphbabet: $alphbabet, ')
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
  static const VerificationMeta _difficultyGradeMeta =
      const VerificationMeta('difficultyGrade');
  @override
  late final GeneratedColumnWithTypeConverter<DifficultyGrade?, int>
      difficultyGrade = GeneratedColumn<int>(
              'difficulty_grade', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<DifficultyGrade?>(
              $DbWordTableTable.$converterdifficultyGrade);
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
      [id, value, reading, isCommon, priority, difficultyGrade, meaningEntries];
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
    context.handle(_difficultyGradeMeta, const VerificationResult.success());
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
      difficultyGrade: $DbWordTableTable.$converterdifficultyGrade.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.int, data['${effectivePrefix}difficulty_grade'])),
      meaningEntries: $DbWordTableTable.$convertermeaningEntries.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}meaning_entries'])!),
    );
  }

  @override
  $DbWordTableTable createAlias(String alias) {
    return $DbWordTableTable(attachedDatabase, alias);
  }

  static TypeConverter<DifficultyGrade?, int?> $converterdifficultyGrade =
      const DifficultyGradeTypeConverter();
  static TypeConverter<List<MeaningEntry>, String> $convertermeaningEntries =
      const ListConverter(callback: MeaningEntry.fromJson);
}

class DbWord extends DataClass implements Insertable<DbWord> {
  final String id;
  final String value;
  final String reading;
  final bool isCommon;
  final int? priority;
  final DifficultyGrade? difficultyGrade;
  final List<MeaningEntry> meaningEntries;
  const DbWord(
      {required this.id,
      required this.value,
      required this.reading,
      required this.isCommon,
      this.priority,
      this.difficultyGrade,
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
    if (!nullToAbsent || difficultyGrade != null) {
      map['difficulty_grade'] = Variable<int>(
          $DbWordTableTable.$converterdifficultyGrade.toSql(difficultyGrade));
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
      difficultyGrade: difficultyGrade == null && nullToAbsent
          ? const Value.absent()
          : Value(difficultyGrade),
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
      difficultyGrade:
          serializer.fromJson<DifficultyGrade?>(json['difficultyGrade']),
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
      'difficultyGrade': serializer.toJson<DifficultyGrade?>(difficultyGrade),
      'meaningEntries': serializer.toJson<List<MeaningEntry>>(meaningEntries),
    };
  }

  DbWord copyWith(
          {String? id,
          String? value,
          String? reading,
          bool? isCommon,
          Value<int?> priority = const Value.absent(),
          Value<DifficultyGrade?> difficultyGrade = const Value.absent(),
          List<MeaningEntry>? meaningEntries}) =>
      DbWord(
        id: id ?? this.id,
        value: value ?? this.value,
        reading: reading ?? this.reading,
        isCommon: isCommon ?? this.isCommon,
        priority: priority.present ? priority.value : this.priority,
        difficultyGrade: difficultyGrade.present
            ? difficultyGrade.value
            : this.difficultyGrade,
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
          ..write('difficultyGrade: $difficultyGrade, ')
          ..write('meaningEntries: $meaningEntries')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, value, reading, isCommon, priority, difficultyGrade, meaningEntries);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbWord &&
          other.id == this.id &&
          other.value == this.value &&
          other.reading == this.reading &&
          other.isCommon == this.isCommon &&
          other.priority == this.priority &&
          other.difficultyGrade == this.difficultyGrade &&
          other.meaningEntries == this.meaningEntries);
}

class DbWordTableCompanion extends UpdateCompanion<DbWord> {
  final Value<String> id;
  final Value<String> value;
  final Value<String> reading;
  final Value<bool> isCommon;
  final Value<int?> priority;
  final Value<DifficultyGrade?> difficultyGrade;
  final Value<List<MeaningEntry>> meaningEntries;
  final Value<int> rowid;
  const DbWordTableCompanion({
    this.id = const Value.absent(),
    this.value = const Value.absent(),
    this.reading = const Value.absent(),
    this.isCommon = const Value.absent(),
    this.priority = const Value.absent(),
    this.difficultyGrade = const Value.absent(),
    this.meaningEntries = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbWordTableCompanion.insert({
    required String id,
    required String value,
    required String reading,
    required bool isCommon,
    this.priority = const Value.absent(),
    this.difficultyGrade = const Value.absent(),
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
    Expression<int>? difficultyGrade,
    Expression<String>? meaningEntries,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (value != null) 'value': value,
      if (reading != null) 'reading': reading,
      if (isCommon != null) 'is_common': isCommon,
      if (priority != null) 'priority': priority,
      if (difficultyGrade != null) 'difficulty_grade': difficultyGrade,
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
      Value<DifficultyGrade?>? difficultyGrade,
      Value<List<MeaningEntry>>? meaningEntries,
      Value<int>? rowid}) {
    return DbWordTableCompanion(
      id: id ?? this.id,
      value: value ?? this.value,
      reading: reading ?? this.reading,
      isCommon: isCommon ?? this.isCommon,
      priority: priority ?? this.priority,
      difficultyGrade: difficultyGrade ?? this.difficultyGrade,
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
    if (difficultyGrade.present) {
      map['difficulty_grade'] = Variable<int>($DbWordTableTable
          .$converterdifficultyGrade
          .toSql(difficultyGrade.value));
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
          ..write('difficultyGrade: $difficultyGrade, ')
          ..write('meaningEntries: $meaningEntries, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$KKDatabase extends GeneratedDatabase {
  _$KKDatabase(QueryExecutor e) : super(e);
  late final $DbCharacterTableTable dbCharacterTable =
      $DbCharacterTableTable(this);
  late final $DbWordTableTable dbWordTable = $DbWordTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [dbCharacterTable, dbWordTable];
}
