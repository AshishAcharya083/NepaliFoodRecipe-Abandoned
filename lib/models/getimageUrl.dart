import 'package:food/models/networking.dart';

class ImageModel {
  Future<dynamic> getImageUrl(String imageName) async {
    NetworkHelper networkHelper = NetworkHelper(search: imageName);
    var decodedData = await networkHelper.getJsonData();

   String imageUrl = await decodedData['results'][0]['urls']['small'];
    return imageUrl;
  }
}
