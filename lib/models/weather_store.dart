import 'package:mobx/mobx.dart';
import '../api_constants.dart';
import '../db/entity/weather_entity.dart';
import '../repository/weather_repository.dart';

part 'weather_store.g.dart';

class WeatherStore = _WeatherStore with _$WeatherStore;

abstract class _WeatherStore with Store {
  final repository = WeatherRepository();

  @observable
  ObservableFuture<Weather?> futureWeather = ObservableFuture<Weather?>(Future.value());

  @observable
  bool isReloading = false;

  @observable
  String cityName = city;

  @action
  void setCityName(String name) {
    cityName = name;
  }

  @action
  Future<void> fetchWeatherByCity() async {
    if (cityName.isNotEmpty) {
      isReloading = true;
      try {
        final weather = await repository.getWeatherByCity(cityName);
        futureWeather = ObservableFuture<Weather?>(Future.value(weather));
      } catch (error) {
        futureWeather = ObservableFuture<Weather?>(Future.error(error));
      } finally {
        isReloading = false;
      }
    }
  }

  @action
  Future<void> refreshWeather() async {
    isReloading = true;
    try {
      final weather = await repository.updateWeather(cityName);
      futureWeather = ObservableFuture<Weather?>(Future.value(weather));
    } catch (error) {
      futureWeather = ObservableFuture<Weather?>(Future.error(error));
    } finally {
      isReloading = false;
    }
  }

  @action
  Future<void> loadInitialWeather() async {
    await fetchWeatherByCity();
  }
}
