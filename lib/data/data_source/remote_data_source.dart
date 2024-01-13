import 'dart:convert';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  static Future<String> getWeatherMapServices(
      ) async {
    String rainProbability = '';
    String location = 'Medellin';

    String apiKey = '4ecbe99f635f10a53416778bd51cad7a';

   /* http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=6.25184&lon=75.56359&appid=4ecbe99f635f10a53416778bd51cad7a'));*/

   // final data = jsonDecode(response.body);
    //final long = data["city"]["coord"]["lon"];
    //final lant = data["city"]["coord"]["lat"];

    http.Response responseRain = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=6.25184&lon=75.56359&appid=$apiKey'));

    final dataRain = jsonDecode(responseRain.body);

    rainProbability = dataRain["weather"].first["description"].toString();

    return rainProbability.toString();
  }


  static Future<String> getWeatherMapServicesByDate(DateTime date) async {
     String rainProbability = '';
    String location = 'Medellin';

    String apiKey = '4ecbe99f635f10a53416778bd51cad7a';

    // Convertir la fecha de Dart a Unix timestamp
    int unixTimestamp = (date.toUtc().millisecondsSinceEpoch / 1000).round();

    // Obtener el pronóstico del tiempo para una fecha específica
    http.Response response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=$location&dt=$unixTimestamp&appid=$apiKey'));

    final data = jsonDecode(response.body);

    // Obtener la descripción del estado del tiempo (probabilidad de lluvia)
    var weatherDescription = data["weather"].first["description"];
    rainProbability = weatherDescription.toString();

    return rainProbability;
  
  }
}
