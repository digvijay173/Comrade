import 'package:Comrade/gallery.dart';
import 'package:Comrade/profile.dart';
import 'package:Comrade/sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Comrade/signin.dart' as signin;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //LoginPage loginPage = LoginPage();
    return Scaffold(
      drawer: NavDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          iconTheme: new IconThemeData(
            color: Colors.black,
            size: 100.0,
          ),
          centerTitle: true,
          //backgroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'Home',
            style: TextStyle(color: Colors.black, fontSize: 35),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        color: Color.fromARGB(255, 246, 238, 85),
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            Card(
              elevation: 0,
              child: Image.asset("assets/Comrade.png"),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 0, 40),
              child: Text(
                'Hi ' + signin.name + ", ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              elevation: 10,
              margin: new EdgeInsets.fromLTRB(15, 0, 15, 15),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.amber,
                    width: 10,
                    height: 50,
                  ),
                  SizedBox(
                    width: 10.0,
                    height: 50,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Profile();
                        }));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              'Profiles',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 10,
              margin: new EdgeInsets.fromLTRB(15, 0, 15, 15),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.amber,
                    width: 10,
                    height: 50,
                  ),
                  SizedBox(
                    width: 10.0,
                    height: 50,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Gallery();
                        // }));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              'Gallery',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 10,
              margin: new EdgeInsets.fromLTRB(15, 0, 15, 15),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.amber,
                    width: 10,
                    height: 50,
                  ),
                  SizedBox(
                    width: 10.0,
                    height: 50,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print('testing');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              'About Us',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /* Card(
              elevation: 10,
              margin: new EdgeInsets.fromLTRB(15, 0, 15, 5),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.amber,
                    width: 10,
                    height: 50,
                  ),
                  SizedBox(
                    width: 10.0,
                    height: 50,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print('testing');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              'Profiles',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
