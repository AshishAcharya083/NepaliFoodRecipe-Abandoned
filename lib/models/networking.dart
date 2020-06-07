import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

const myApiKey = 'pnddBzwFT4wI7MvYeIWucAV-i_cQ0GZ141lte8niAdY';
// const unsplashUrl = 'https://api.unsplash.com/search/photos?per_page=30&client_id=it1PXzVQRnxgz8v8hazcst7G9rNfXk1qiS8FgHTTMMk&query=${_search}'

class NetworkHelper {
  String search;
  String imageUrl;

  NetworkHelper({this.search});

  Future<String> getJsonData() async {
    
    http.Response response = await http.get(
        'https://api.unsplash.com/search/photos?per_page=1&client_id=pnddBzwFT4wI7MvYeIWucAV-i_cQ0GZ141lte8niAdY&query=$search');
    
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      String finalData = decodedData['results'][0]['urls']['small'];
      return finalData;
    } else {
      print('There is an error of status code ${response.statusCode}');
      return '${response.statusCode}';
    }
  }
}
