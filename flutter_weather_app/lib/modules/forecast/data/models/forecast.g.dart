// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Forecast> _$forecastSerializer = new _$ForecastSerializer();

class _$ForecastSerializer implements StructuredSerializer<Forecast> {
  @override
  final Iterable<Type> types = const [Forecast, _$Forecast];
  @override
  final String wireName = 'Forecast';

  @override
  Iterable<Object?> serialize(Serializers serializers, Forecast object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'dateTime',
      serializers.serialize(object.dateTime,
          specifiedType: const FullType(String)),
      'tempMin',
      serializers.serialize(object.tempMin,
          specifiedType: const FullType(double)),
      'tempMax',
      serializers.serialize(object.tempMax,
          specifiedType: const FullType(double)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'icon',
      serializers.serialize(object.icon, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Forecast deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ForecastBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'dateTime':
          result.dateTime = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'tempMin':
          result.tempMin = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'tempMax':
          result.tempMax = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Forecast extends Forecast {
  @override
  final String dateTime;
  @override
  final double tempMin;
  @override
  final double tempMax;
  @override
  final String description;
  @override
  final String icon;

  factory _$Forecast([void Function(ForecastBuilder)? updates]) =>
      (new ForecastBuilder()..update(updates))._build();

  _$Forecast._(
      {required this.dateTime,
      required this.tempMin,
      required this.tempMax,
      required this.description,
      required this.icon})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(dateTime, r'Forecast', 'dateTime');
    BuiltValueNullFieldError.checkNotNull(tempMin, r'Forecast', 'tempMin');
    BuiltValueNullFieldError.checkNotNull(tempMax, r'Forecast', 'tempMax');
    BuiltValueNullFieldError.checkNotNull(
        description, r'Forecast', 'description');
    BuiltValueNullFieldError.checkNotNull(icon, r'Forecast', 'icon');
  }

  @override
  Forecast rebuild(void Function(ForecastBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ForecastBuilder toBuilder() => new ForecastBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Forecast &&
        dateTime == other.dateTime &&
        tempMin == other.tempMin &&
        tempMax == other.tempMax &&
        description == other.description &&
        icon == other.icon;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dateTime.hashCode);
    _$hash = $jc(_$hash, tempMin.hashCode);
    _$hash = $jc(_$hash, tempMax.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Forecast')
          ..add('dateTime', dateTime)
          ..add('tempMin', tempMin)
          ..add('tempMax', tempMax)
          ..add('description', description)
          ..add('icon', icon))
        .toString();
  }
}

class ForecastBuilder implements Builder<Forecast, ForecastBuilder> {
  _$Forecast? _$v;

  String? _dateTime;
  String? get dateTime => _$this._dateTime;
  set dateTime(String? dateTime) => _$this._dateTime = dateTime;

  double? _tempMin;
  double? get tempMin => _$this._tempMin;
  set tempMin(double? tempMin) => _$this._tempMin = tempMin;

  double? _tempMax;
  double? get tempMax => _$this._tempMax;
  set tempMax(double? tempMax) => _$this._tempMax = tempMax;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  ForecastBuilder();

  ForecastBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dateTime = $v.dateTime;
      _tempMin = $v.tempMin;
      _tempMax = $v.tempMax;
      _description = $v.description;
      _icon = $v.icon;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Forecast other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Forecast;
  }

  @override
  void update(void Function(ForecastBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Forecast build() => _build();

  _$Forecast _build() {
    final _$result = _$v ??
        new _$Forecast._(
            dateTime: BuiltValueNullFieldError.checkNotNull(
                dateTime, r'Forecast', 'dateTime'),
            tempMin: BuiltValueNullFieldError.checkNotNull(
                tempMin, r'Forecast', 'tempMin'),
            tempMax: BuiltValueNullFieldError.checkNotNull(
                tempMax, r'Forecast', 'tempMax'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'Forecast', 'description'),
            icon: BuiltValueNullFieldError.checkNotNull(
                icon, r'Forecast', 'icon'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
