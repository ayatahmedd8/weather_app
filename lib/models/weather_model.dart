class WeatherModel{

  final String cityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double MaxTemp;
  final double MinTemp;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.date,
    this.image,
    required this.temp,
    required this.MaxTemp,
    required this.MinTemp,
    required this.weatherCondition});

  factory WeatherModel.fromjson(json){
         return WeatherModel(
             cityName: json['location']['name'],
             date: DateTime.parse(json['current']['last_updated']),
             temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
             MaxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
             MinTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
             weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text'],
             image: json['forecast']['forecastday'][0]['day']['condition']['icon']
         );
  }
}