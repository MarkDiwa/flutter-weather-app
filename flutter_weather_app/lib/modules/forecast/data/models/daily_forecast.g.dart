// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_forecast.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DailyForecast> _$dailyForecastSerializer =
    new _$DailyForecastSerializer();

class _$DailyForecastSerializer implements StructuredSerializer<DailyForecast> {
  @override
  final Iterable<Type> types = const [DailyForecast, _$DailyForecast];
  @override
  final String wireName = 'DailyForecast';

  @override
  Iterable<Object?> serialize(Serializers serializers, DailyForecast object,
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
      'temp',
      serializers.serialize(object.temp, specifiedType: const FullType(double)),
      'feelsLike',
      serializers.serialize(object.feelsLike,
          specifiedType: const FullType(double)),
      'humidity',
      serializers.serialize(object.humidity,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  DailyForecast deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DailyForecastBuilder();

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
        case 'temp':
          result.temp = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'feelsLike':
          result.feelsLike = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'humidity':
          result.humidity = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$DailyForecast extends DailyForecast {
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
  @override
  final double temp;
  @override
  final double feelsLike;
  @override
  final int humidity;

  factory _$DailyForecast([void Function(DailyForecastBuilder)? updates]) =>
      (new DailyForecastBuilder()..update(updates))._build();

  _$DailyForecast._(
      {required this.dateTime,
      required this.tempMin,
      required this.tempMax,
      required this.description,
      required this.icon,
      required this.temp,
      required this.feelsLike,
      required this.humidity})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        dateTime, r'DailyForecast', 'dateTime');
    BuiltValueNullFieldError.checkNotNull(tempMin, r'DailyForecast', 'tempMin');
    BuiltValueNullFieldError.checkNotNull(tempMax, r'DailyForecast', 'tempMax');
    BuiltValueNullFieldError.checkNotNull(
        description, r'DailyForecast', 'description');
    BuiltValueNullFieldError.checkNotNull(icon, r'DailyForecast', 'icon');
    BuiltValueNullFieldError.checkNotNull(temp, r'DailyForecast', 'temp');
    BuiltValueNullFieldError.checkNotNull(
        feelsLike, r'DailyForecast', 'feelsLike');
    BuiltValueNullFieldError.checkNotNull(
        humidity, r'DailyForecast', 'humidity');
  }

  @override
  DailyForecast rebuild(void Function(DailyForecastBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DailyForecastBuilder toBuilder() => new DailyForecastBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DailyForecast &&
        dateTime == other.dateTime &&
        tempMin == other.tempMin &&
        tempMax == other.tempMax &&
        description == other.description &&
        icon == other.icon &&
        temp == other.temp &&
        feelsLike == other.feelsLike &&
        humidity == other.humidity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dateTime.hashCode);
    _$hash = $jc(_$hash, tempMin.hashCode);
    _$hash = $jc(_$hash, tempMax.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, temp.hashCode);
    _$hash = $jc(_$hash, feelsLike.hashCode);
    _$hash = $jc(_$hash, humidity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DailyForecast')
          ..add('dateTime', dateTime)
          ..add('tempMin', tempMin)
          ..add('tempMax', tempMax)
          ..add('description', description)
          ..add('icon', icon)
          ..add('temp', temp)
          ..add('feelsLike', feelsLike)
          ..add('humidity', humidity))
        .toString();
  }
}

class DailyForecastBuilder
    implements Builder<DailyForecast, DailyForecastBuilder> {
  _$DailyForecast? _$v;

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

  double? _temp;
  double? get temp => _$this._temp;
  set temp(double? temp) => _$this._temp = temp;

  double? _feelsLike;
  double? get feelsLike => _$this._feelsLike;
  set feelsLike(double? feelsLike) => _$this._feelsLike = feelsLike;

  int? _humidity;
  int? get humidity => _$this._humidity;
  set humidity(int? humidity) => _$this._humidity = humidity;

  DailyForecastBuilder();

  DailyForecastBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dateTime = $v.dateTime;
      _tempMin = $v.tempMin;
      _tempMax = $v.tempMax;
      _description = $v.description;
      _icon = $v.icon;
      _temp = $v.temp;
      _feelsLike = $v.feelsLike;
      _humidity = $v.humidity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DailyForecast other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DailyForecast;
  }

  @override
  void update(void Function(DailyForecastBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DailyForecast build() => _build();

  _$DailyForecast _build() {
    final _$result = _$v ??
        new _$DailyForecast._(
            dateTime: BuiltValueNullFieldError.checkNotNull(
                dateTime, r'DailyForecast', 'dateTime'),
            tempMin: BuiltValueNullFieldError.checkNotNull(
                tempMin, r'DailyForecast', 'tempMin'),
            tempMax: BuiltValueNullFieldError.checkNotNull(
                tempMax, r'DailyForecast', 'tempMax'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'DailyForecast', 'description'),
            icon: BuiltValueNullFieldError.checkNotNull(
                icon, r'DailyForecast', 'icon'),
            temp: BuiltValueNullFieldError.checkNotNull(
                temp, r'DailyForecast', 'temp'),
            feelsLike: BuiltValueNullFieldError.checkNotNull(
                feelsLike, r'DailyForecast', 'feelsLike'),
            humidity: BuiltValueNullFieldError.checkNotNull(
                humidity, r'DailyForecast', 'humidity'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
