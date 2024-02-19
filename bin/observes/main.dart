//Chapter 2
void main() {}

class WeatherData implements Subject {
  late List<Observer> observers;
  var temperature;
  var humidity;
  var pressure;

  WeatherData() {
    observers = <Observer>[];
  }

  @override
  void registerObserver(Observer o) {
    observers.add(o);
  }

  void removeObserver(Observer o) {
    observers.remove(o);
  }

  void notifyObservers() {
    for (Observer observer in observers) {
      observer.update(temperature, humidity, pressure);
    }
  }

  getTemperature() {
    print(temperature);
  }

  getHumidity() {
    print(humidity);
  }

  getPressure() {
    print(pressure);
  }

  void measurementsChanged() {
    notifyObservers();
  }

  void setMeasurements(final temperature, final humidity, final pressure) {
    this.temperature = temperature;
    this.humidity = humidity;
    this.pressure = pressure;
    measurementsChanged();
  }
}

class Subject {
  void registerObserver(Observer o) {}
  void removeObserver(Observer o) {}
  void notifyObservers() {}
}

class Observer {
  void update(final temperature, final humidity, final pressure) {}
}

class DisplayElement {
  void display() {}
}

class CurrentConditionDisplay implements Observer, DisplayElement {
  var temperature;
  var humidity;
  late WeatherData weatherData;

  CurrentConditionDisplay(WeatherData weatherData) {
    this.weatherData = weatherData;
    weatherData.registerObserver(this);
  }

  @override
  void display() {
    print("Current conditions: " +
        temperature +
        "F degrees and " +
        humidity +
        "% humidity");
  }

  @override
  void update(temperature, humidity, pressure) {
    this.temperature = temperature;
    this.humidity = humidity;
    display();
  }
}

class StatisticsDisplay implements Observer, DisplayElement {
  var temperature;
  var humidity;
  late WeatherData weatherData;

  StatisticsDisplay(WeatherData weatherData) {
    this.weatherData = weatherData;
    weatherData.registerObserver(this);
  }

  @override
  void display() {
    print(
        "Avg/Max/Min temperature = " + temperature + temperature + temperature);
  }

  @override
  void update(temperature, humidity, pressure) {
    this.temperature = temperature;
    this.humidity = humidity;
    display();
  }
}

class ForecastDisplay implements Observer, DisplayElement {
  var currentPressure = 29.2;
  var lastPressure;
  late WeatherData weatherData;
  ForecastDisplay(WeatherData weatherData) {
    this.weatherData = weatherData;
    weatherData.registerObserver(this);
  }
  @override
  void display() {
    if (currentPressure == 80) {
      print("Forecast: Improving weather on ther way!");
    } else if (currentPressure < 80) {
      print("Forecast: Watch out for cooler, rainy weather");
    } else if (currentPressure > 80) {
      print("More of the same");
    }
  }

  @override
  void update(temperature, humidity, pressure) {
    temperature = weatherData.getTemperature();
    humidity = weatherData.getHumidity();
    lastPressure = currentPressure;
    currentPressure = weatherData.getPressure();
    display();
  }
}
