// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCardModelCollection on Isar {
  IsarCollection<CardModel> get cardModels => this.collection();
}

const CardModelSchema = CollectionSchema(
  name: r'CardModel',
  id: -4511307714291515206,
  properties: {
    r'bankName': PropertySchema(
      id: 0,
      name: r'bankName',
      type: IsarType.string,
    ),
    r'cardExpiry': PropertySchema(
      id: 1,
      name: r'cardExpiry',
      type: IsarType.string,
    ),
    r'cardHolderName': PropertySchema(
      id: 2,
      name: r'cardHolderName',
      type: IsarType.string,
    ),
    r'cardNo': PropertySchema(
      id: 3,
      name: r'cardNo',
      type: IsarType.string,
    ),
    r'cardType': PropertySchema(
      id: 4,
      name: r'cardType',
      type: IsarType.byte,
      enumMap: _CardModelcardTypeEnumValueMap,
    ),
    r'cvvNo': PropertySchema(
      id: 5,
      name: r'cvvNo',
      type: IsarType.string,
    )
  },
  estimateSize: _cardModelEstimateSize,
  serialize: _cardModelSerialize,
  deserialize: _cardModelDeserialize,
  deserializeProp: _cardModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _cardModelGetId,
  getLinks: _cardModelGetLinks,
  attach: _cardModelAttach,
  version: '3.1.0+1',
);

int _cardModelEstimateSize(
  CardModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bankName.length * 3;
  bytesCount += 3 + object.cardExpiry.length * 3;
  bytesCount += 3 + object.cardHolderName.length * 3;
  bytesCount += 3 + object.cardNo.length * 3;
  bytesCount += 3 + object.cvvNo.length * 3;
  return bytesCount;
}

void _cardModelSerialize(
  CardModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bankName);
  writer.writeString(offsets[1], object.cardExpiry);
  writer.writeString(offsets[2], object.cardHolderName);
  writer.writeString(offsets[3], object.cardNo);
  writer.writeByte(offsets[4], object.cardType.index);
  writer.writeString(offsets[5], object.cvvNo);
}

CardModel _cardModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CardModel(
    bankName: reader.readString(offsets[0]),
    cardExpiry: reader.readString(offsets[1]),
    cardHolderName: reader.readString(offsets[2]),
    cardNo: reader.readString(offsets[3]),
    cardType:
        _CardModelcardTypeValueEnumMap[reader.readByteOrNull(offsets[4])] ??
            CardType.masterCard,
    cvvNo: reader.readString(offsets[5]),
  );
  object.id = id;
  return object;
}

P _cardModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (_CardModelcardTypeValueEnumMap[reader.readByteOrNull(offset)] ??
          CardType.masterCard) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CardModelcardTypeEnumValueMap = {
  'masterCard': 0,
  'visa': 1,
  'other': 2,
};
const _CardModelcardTypeValueEnumMap = {
  0: CardType.masterCard,
  1: CardType.visa,
  2: CardType.other,
};

Id _cardModelGetId(CardModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cardModelGetLinks(CardModel object) {
  return [];
}

void _cardModelAttach(IsarCollection<dynamic> col, Id id, CardModel object) {
  object.id = id;
}

extension CardModelQueryWhereSort
    on QueryBuilder<CardModel, CardModel, QWhere> {
  QueryBuilder<CardModel, CardModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CardModelQueryWhere
    on QueryBuilder<CardModel, CardModel, QWhereClause> {
  QueryBuilder<CardModel, CardModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CardModelQueryFilter
    on QueryBuilder<CardModel, CardModel, QFilterCondition> {
  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> bankNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> bankNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> bankNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> bankNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bankName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> bankNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> bankNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> bankNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> bankNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bankName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> bankNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankName',
        value: '',
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition>
      bankNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bankName',
        value: '',
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cardExpiryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardExpiry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition>
      cardExpiryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cardExpiry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cardExpiryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cardExpiry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cardExpiryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cardExpiry',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition>
      cardExpiryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cardExpiry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cardExpiryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cardExpiry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cardExpiryContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cardExpiry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cardExpiryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cardExpiry',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition>
      cardExpiryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardExpiry',
        value: '',
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition>
      cardExpiryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cardExpiry',
        value: '',
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition>
      cardHolderNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition>
      cardHolderNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cardHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition>
      cardHolderNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cardHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition>
      cardHolderNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cardHolderName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition>
      cardHolderNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cardHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition>
      cardHolderNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cardHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition>
      cardHolderNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cardHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition>
      cardHolderNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cardHolderName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition>
      cardHolderNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardHolderName',
        value: '',
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition>
      cardHolderNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cardHolderName',
        value: '',
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cardNoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cardNoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cardNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cardNoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cardNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cardNoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cardNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cardNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cardNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cardNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cardNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cardNoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cardNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cardNoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cardNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cardNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardNo',
        value: '',
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cardNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cardNo',
        value: '',
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cardTypeEqualTo(
      CardType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardType',
        value: value,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cardTypeGreaterThan(
    CardType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cardType',
        value: value,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cardTypeLessThan(
    CardType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cardType',
        value: value,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cardTypeBetween(
    CardType lower,
    CardType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cardType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cvvNoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cvvNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cvvNoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cvvNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cvvNoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cvvNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cvvNoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cvvNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cvvNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cvvNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cvvNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cvvNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cvvNoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cvvNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cvvNoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cvvNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cvvNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cvvNo',
        value: '',
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> cvvNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cvvNo',
        value: '',
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CardModelQueryObject
    on QueryBuilder<CardModel, CardModel, QFilterCondition> {}

extension CardModelQueryLinks
    on QueryBuilder<CardModel, CardModel, QFilterCondition> {}

extension CardModelQuerySortBy on QueryBuilder<CardModel, CardModel, QSortBy> {
  QueryBuilder<CardModel, CardModel, QAfterSortBy> sortByBankName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.asc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> sortByBankNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.desc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> sortByCardExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardExpiry', Sort.asc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> sortByCardExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardExpiry', Sort.desc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> sortByCardHolderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardHolderName', Sort.asc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> sortByCardHolderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardHolderName', Sort.desc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> sortByCardNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardNo', Sort.asc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> sortByCardNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardNo', Sort.desc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> sortByCardType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardType', Sort.asc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> sortByCardTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardType', Sort.desc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> sortByCvvNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cvvNo', Sort.asc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> sortByCvvNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cvvNo', Sort.desc);
    });
  }
}

extension CardModelQuerySortThenBy
    on QueryBuilder<CardModel, CardModel, QSortThenBy> {
  QueryBuilder<CardModel, CardModel, QAfterSortBy> thenByBankName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.asc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> thenByBankNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.desc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> thenByCardExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardExpiry', Sort.asc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> thenByCardExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardExpiry', Sort.desc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> thenByCardHolderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardHolderName', Sort.asc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> thenByCardHolderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardHolderName', Sort.desc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> thenByCardNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardNo', Sort.asc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> thenByCardNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardNo', Sort.desc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> thenByCardType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardType', Sort.asc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> thenByCardTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardType', Sort.desc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> thenByCvvNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cvvNo', Sort.asc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> thenByCvvNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cvvNo', Sort.desc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CardModel, CardModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension CardModelQueryWhereDistinct
    on QueryBuilder<CardModel, CardModel, QDistinct> {
  QueryBuilder<CardModel, CardModel, QDistinct> distinctByBankName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bankName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CardModel, CardModel, QDistinct> distinctByCardExpiry(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cardExpiry', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CardModel, CardModel, QDistinct> distinctByCardHolderName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cardHolderName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CardModel, CardModel, QDistinct> distinctByCardNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cardNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CardModel, CardModel, QDistinct> distinctByCardType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cardType');
    });
  }

  QueryBuilder<CardModel, CardModel, QDistinct> distinctByCvvNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cvvNo', caseSensitive: caseSensitive);
    });
  }
}

extension CardModelQueryProperty
    on QueryBuilder<CardModel, CardModel, QQueryProperty> {
  QueryBuilder<CardModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CardModel, String, QQueryOperations> bankNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bankName');
    });
  }

  QueryBuilder<CardModel, String, QQueryOperations> cardExpiryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cardExpiry');
    });
  }

  QueryBuilder<CardModel, String, QQueryOperations> cardHolderNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cardHolderName');
    });
  }

  QueryBuilder<CardModel, String, QQueryOperations> cardNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cardNo');
    });
  }

  QueryBuilder<CardModel, CardType, QQueryOperations> cardTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cardType');
    });
  }

  QueryBuilder<CardModel, String, QQueryOperations> cvvNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cvvNo');
    });
  }
}
