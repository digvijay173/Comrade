// import 'package:Comrade/home.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => new _LoginPageState();
// }

// String name;
// String email;
// String imageUrl;
// final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn();

// class _LoginPageState extends State<LoginPage>
//     with SingleTickerProviderStateMixin {
//   Widget signInButton() {
//     return OutlineButton(
//       splashColor: Colors.grey,
//       onPressed: () {
//         signinwithGoogle().whenComplete(() {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (context) {
//                 return Home();
//               },
//             ),
//           );
//         });
//       },
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//       highlightElevation: 0,
//       borderSide: BorderSide(color: Colors.grey),
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
//             Padding(
//               padding: const EdgeInsets.only(left: 10),
//               child: Text(
//                 'Sign in with Google',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.black,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // implement build
//     return Scaffold(
//       /*appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.black,
//         title: Text('SignIn'),
//       ),*/
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(height: 50),
//             signInButton(),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<User> signinwithGoogle() async {
//     final GoogleSignInAccount googleUser = await googleSignIn.signIn();
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser.authentication;

//     final AuthCredential credential = GoogleAuthProvider.credential(
//         idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

//     final UserCredential authResult =
//         await firebaseAuth.signInWithCredential(credential);
//     final User user = authResult.user;

//     assert(user.email != null);
//     assert(user.displayName != null);
//     assert(user.photoURL != null);

//     name = user.displayName;
//     email = user.email;
//     imageUrl = user.photoURL;

//     if (name.contains(" ")) {
//       name = name.substring(0, name.indexOf(" "));
//     }
//     final User currentUser = firebaseAuth.currentUser;
//     assert(user.uid == currentUser.uid);

//     print("signed in " + user.displayName + "\n" + user.photoURL);

//     return 'signInWithGoogle succeeded: $user';
//   }

//   void signOutGoogle() async {
//     await googleSignIn.signOut();

//     print("User Sign Out");
//   }
// }
