import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_core/firebase_core.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final FirebaseStorage storage = FirebaseStorage(
      app: Firestore.instance.app,
      storageBucket: 'gs://food-recipes-in-nepali.appspot.com');
  @override
  void initState() {
    super.initState();
    _getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FIrebase test only'),
      ),
      body: Center(
        child: Text('ashish'),
      ),
    );
  }

  Future<dynamic> _getImage() async {
    final image = storage.ref().child('testimage.jpg');

    var url = await image.getDownloadURL();
    print(url);
  }
}

// FutureBuilder(
//         future: _getImage(context , image),
//         builder: (context,snapshot){
//           if(snapshot.connectionState == ConnectionState.done){
//             return Container(
//               height: MediaQuery.of(context).size.height * 0.7,
//               width: MediaQuery.of(context).size.width * 0.9,
//               child: snapshot.data,

//             );

//           }
//           if(snapshot.connectionState == ConnectionState.waiting) {
//             return Container(
//               height: 300,
//               width: 300,
//               child: CircularProgressIndicator(),

//             );
//           }
//           return Container();
//         } )
