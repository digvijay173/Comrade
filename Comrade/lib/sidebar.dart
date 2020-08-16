import 'package:Comrade/home.dart';
import 'package:Comrade/signin.dart';
import 'package:flutter/material.dart';
import 'package:Comrade/signin.dart' as signin;

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      shrinkWrap: true, //just set this property
      padding: EdgeInsets.zero,
      children: <Widget>[
        new UserAccountsDrawerHeader(
          accountEmail: Text(signin.email),
          accountName: new Text(signin.name),
          currentAccountPicture: new GestureDetector(
            child: new CircleAvatar(
              backgroundImage: new NetworkImage(signin.imageUrl),
            ),
            onTap: () => print("This is your current account."),
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage('assets/sidebar.jpg'))),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Home();
            }))
          },
        ),
        ListTile(
          leading: Icon(Icons.verified_user),
          title: Text('Profiles'),
          onTap: () => {Navigator.of(context).pop()},
        ),
        ListTile(
          leading: Icon(Icons.photo),
          title: Text('Gallerys'),
          onTap: () => {Navigator.of(context).pop()},
        ),
        ListTile(
          leading: Icon(Icons.lightbulb_outline),
          title: Text('About'),
          onTap: () => {Navigator.of(context).pop()},
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Logout'),
          onTap: () {
            signOutGoogle();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
              return LoginPage();
            }), ModalRoute.withName('/'));
          },
        ),
        Expanded(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: ListTile(
            contentPadding: EdgeInsets.fromLTRB(30, 260, 0, 0),
            title: Text(
              "@ Copyright Comrade Technical Team",
            ),
          ),
        ))
      ],
    ));
  }
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}
