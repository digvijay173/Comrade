import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Comrade/signin.dart' as signin;
import 'package:google_sign_in/google_sign_in.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
      ),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(
              signin.imageUrl,
            ),
            radius: 60,
            backgroundColor: Colors.transparent,
          ),
          SizedBox(height: 40),
          Text(
            'NAME',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
          Text(
            signin.name,
            style: TextStyle(
                fontSize: 25,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'EMAIL',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
          Text(
            signin.email,
            style: TextStyle(
                fontSize: 25,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

Future googleSignIn() async {
  try {
    GoogleSignInAccount googleUser = await signin.googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    FirebaseUser user =
        (await signin.firebaseAuth.signInWithCredential(credential)).user;
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await signin.firebaseAuth.currentUser();
    assert(user.uid == currentUser.uid);

    print("signed in " + user.displayName + "\n" + user.photoUrl);

    return user;
  } catch (e) {
    print(e.toString());
    return null;
  }
}
