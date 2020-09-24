import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final FirebaseFirestore fb = FirebaseFirestore.instance;
  File _image;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          FutureBuilder(
            future: getImages(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        title: Text(snapshot.data.docs[index].get('name')),
                        leading: Image.network(
                            snapshot.data.docs[index].get('url'),
                            fit: BoxFit.fill),
                      );
                    });
              } else if (snapshot.connectionState == ConnectionState.none) {
                return Text("No data");
              }
              return CircularProgressIndicator();
            },
          ),
          RaisedButton(child: Text("Pick Image"), onPressed: getImage),
          _image == null
              ? Text('No image selected.')
              : Image.file(
                  _image,
                  height: 300,
                ),
          RaisedButton(
              child: Text("Save Image"),
              onPressed: () async {
                if (_image != null) {
                  StorageReference ref = FirebaseStorage.instance.ref();
                  StorageTaskSnapshot addImg =
                      await ref.child("image/img").putFile(_image).onComplete;
                  if (addImg.error == null) {
                    print("added to Firebase Storage");
                  }
                }
              }),
        ]),
      ),
    ));
  }

  Future getImage() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _image = image as File;
    });
  }

  Future<QuerySnapshot> getImages() {
    return fb.collection("images").get();
  }
}
