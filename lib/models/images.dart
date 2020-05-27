import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class FoodImage{
String finalImageUrl;

final FirebaseStorage storage = FirebaseStorage(
  app: FirebaseStorage.instance.app,
  storageBucket: 'gs://food-recipes-in-nepali.appspot.com',

);

Future<void> getImage( String foodName)async{
  final image = storage.ref().child('$foodName.jpg');
  var imageUrl = image.getDownloadURL();
  finalImageUrl = await imageUrl;

}


}