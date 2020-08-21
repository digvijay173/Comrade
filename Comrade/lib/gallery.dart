import 'dart:html';
import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  // StreamSubscription<QuerySnapshot> subscription;
  // List<DocumentSnapshot> imageslist;
  // final CollectionReference collectionReference =
  //     FirebaseFirestore.instance.collection("images");

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   subscription = collectionReference.snapshots().listen((QuerySnapshot) {
  //     setState(() {
  //       imageslist = QuerySnapshot.docChanges.
  //       };);
  //     });
  //   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: _buildbody(context),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}

Widget _buildbody(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('images').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.docs);
      });
}

Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return StaggeredGridView.countBuilder(
    padding: const EdgeInsets.all(8.0),
    crossAxisCount: 4,
    itemCount: snapshot.length,
    itemBuilder: (context, i) {
      String imgPath = snapshot[i].get('url');
      return new Material(
        elevation: 8.0,
        borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
        child: new InkWell(
          onTap: () {
            // _sendAnalytics();
            // createInterstitialAd()
            //   ..load()
            //   ..show();
            // Navigator.push(
            //     context,
            //     new MaterialPageRoute(
            //         builder: (context) =>
            //             new FullScreenImagePage(imgPath)));
          },
          child: new Hero(
            tag: imgPath,
            child: new FadeInImage(
              image: new NetworkImage(imgPath),
              fit: BoxFit.cover,
              placeholder: new AssetImage("assets/wallfy.png"),
            ),
          ),
        ),
      );
    },
    staggeredTileBuilder: (i) => new StaggeredTile.count(2, i.isEven ? 2 : 3),
    mainAxisSpacing: 8.0,
    crossAxisSpacing: 8.0,
  );
}

Future getImage() async {
  // ignore: deprecated_member_use
  var image = await ImagePicker().getImage(source: ImageSource.gallery)
  _uploadImageToFirebase(image);
}

Future<void> _uploadImageToFirebase(PickedFile image) async {
  try {
    int randomnum = Random().nextInt(100000);
    String imageLocation = 'images/image${randomnum}.jpg';
    final StorageReference storageReference =
        FirebaseStorage().ref().child(imageLocation);
    final StorageUploadTask storageUploadTask = storageReference.putFile(image);  
  } catch (e) {
    print(e);
  }
}
