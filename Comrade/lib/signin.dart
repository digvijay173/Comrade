import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('SignIn'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Sign In With Google',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: _signinwithGoogle,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }

  _signinwithGoogle() async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    final FirebaseUser user =
        (await firebaseAuth.signInWithCredential(credential)).user;
  }
}
