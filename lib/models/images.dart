// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';






  // Future<dynamic> getImage(BuildContext context, String image) async {
  //   ImageProvider img;

  //   final FirebaseStorage storage = FirebaseStorage(
  //     app: FirebaseStorage.instance.app,
  //     storageBucket: 'gs://food-recipes-in-nepali.appspot.com',
  //   );
  //   final imgRef = storage.ref().child('$image');
  //   var imgUrl = await imgRef.getDownloadURL();

  //   img = NetworkImage(imgUrl);
  //   // print("The image URl is $imgUrl");

  //   return img;
  // }


//  FutureBuilder(
//                       future: getImage(context, '${recipeList[widget.indexOfFood].ename}.jpg'),
//                       builder: (context, snapshot) {
//                         // print("The snapshot's data is ${snapshot.data}");
//                         if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return CupertinoActivityIndicator();
//                         }
//                         if (snapshot.connectionState == ConnectionState.done) {
//                           return Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.only(
//                                     bottomRight: Radius.circular(30),
//                                     bottomLeft: Radius.circular(30)),
//                                 image: DecorationImage(
//                                     image: snapshot.data, fit: BoxFit.cover)),
//                           );
//                         }
//                         return Container();
//                       })