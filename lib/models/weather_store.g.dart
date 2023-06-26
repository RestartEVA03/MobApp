// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WeatherStore on _WeatherStore, Store {
  late final _$futureWeatherAtom =
      Atom(name: '_WeatherStore.futureWeather', context: context);

  @override
  ObservableFuture<Weather?> get futureWeather {
    _$futureWeatherAtom.reportRead();
    return super.futureWeather;
  }

  @override
  set futureWeather(ObservableFuture<Weather?> value) {
    _$futureWeatherAtom.reportWrite(value, super.futureWeather, () {
      super.futureWeather = value;
    });
  }

  late final _$isReloadingAtom =
      Atom(name: '_WeatherStore.isReloading', context: context);

  @override
  bool get isReloading {
    _$isReloadingAtom.reportRead();
    return super.isReloading;
  }

  @override
  set isReloading(bool value) {
    _$isReloadingAtom.reportWrite(value, super.isReloading, () {
      super.isReloading = value;
    });
  }

  late final _$cityNameAtom =
      Atom(name: '_WeatherStore.cityName', context: context);

  @override
  String get cityName {
    _$cityNameAtom.reportRead();
    return super.cityName;
  }

  @override
  set cityName(String value) {
    _$cityNameAtom.reportWrite(value, super.cityName, () {
      super.cityName = value;
    });
  }

  late final _$fetchWeatherByCityAsyncAction =
      AsyncAction('_WeatherStore.fetchWeatherByCity', context: context);

  @override
  Future<void> fetchWeatherByCity() {
    return _$fetchWeatherByCityAsyncAction
        .run(() => super.fetchWeatherByCity());
  }

  late final _$refreshWeatherAsyncAction =
      AsyncAction('_WeatherStore.refreshWeather', context: context);

  @override
  Future<void> refreshWeather() {
    return _$refreshWeatherAsyncAction.run(() => super.refreshWeather());
  }

  late final _$loadInitialWeatherAsyncAction =
      AsyncAction('_WeatherStore.loadInitialWeather', context: context);

  @override
  Future<void> loadInitialWeather() {
    return _$loadInitialWeatherAsyncAction
        .run(() => super.loadInitialWeather());
  }

  late final _$_WeatherStoreActionController =
      ActionController(name: '_WeatherStore', context: context);

  @override
  void setCityName(String name) {
    final _$actionInfo = _$_WeatherStoreActionController.startAction(
        name: '_WeatherStore.setCityName');
    try {
      return super.setCityName(name);
    } finally {
      _$_WeatherStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
futureWeather: ${futureWeather},
isReloading: ${isReloading},
cityName: ${cityName}
    ''';
  }
}
