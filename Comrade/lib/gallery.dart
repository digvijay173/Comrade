// ignore: avoid_web_libraries_in_flutter
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'package:flutter/material.dart';
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

  //@override
  // void initState() {
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
      appBar: AppBar(
        title: Text('Firebase Storage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Flexible(
              child: _buildBody(context),
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

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('storage').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
        padding: const EdgeInsets.only(top: 20.0),
        children:
            snapshot.map((data) => _buildListItem(context, data)).toList());
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.location),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  record.location,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Image.network(record.url),
            ],
          ),
        ),
      ),
    );
  }

  Future getImage() async {
    // Get image from gallery.
    var image =
        // ignore: invalid_use_of_visible_for_testing_member
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    _uploadImageToFirebase(image);
  }

  Future<void> _uploadImageToFirebase(image) async {
    try {
      // Make random image name.
      int randomNumber = Random().nextInt(100000);
      String imageLocation = 'images/image$randomNumber.jpg';

      // Upload image to firebase.
      final StorageReference storageReference =
          FirebaseStorage().ref().child(imageLocation);
      final StorageUploadTask uploadTask = storageReference.putFile(image);
      await uploadTask.onComplete;
      _addPathToDatabase(imageLocation);
    } catch (e) {
      print(e.message);
    }
  }

  Future<void> _addPathToDatabase(String text) async {
    try {
      // Get image URL from firebase
      final ref = FirebaseStorage().ref().child(text);
      var imageString = await ref.getDownloadURL();

      // Add location and url to database
      await FirebaseFirestore.instance
          .collection('storage')
          .doc()
          .set({'url': imageString, 'location': text});
    } catch (e) {
      print(e.message);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message),
            );
          });
    }
  }
}

class Record {
  final String location;
  final String url;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['location'] != null),
        assert(map['url'] != null),
        location = map['location'],
        url = map['url'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Record<$location:$url>";
}
