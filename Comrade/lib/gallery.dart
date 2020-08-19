// import 'package:flutter/cupertino.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:async';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// class Gallery extends StatefulWidget {
//   @override
//   _GalleryState createState() => _GalleryState();
// }

// class _GalleryState extends State<Gallery> {
//   StreamSubscription<QuerySnapshot> subscription;
//   List<DocumentSnapshot> imageslist;
//   final CollectionReference collectionReference =
//       FirebaseFirestore.instance.collection("images");

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     subscription = collectionReference.snapshots().listen((QuerySnapshot) {
//       setState(() {
//         imageslist = QuerySnapshot.docChanges.
//         };)
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
