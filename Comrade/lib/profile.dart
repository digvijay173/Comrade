import 'dart:io';
import 'dart:typed_data';

import 'package:Comrade/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';

//const String _documentPath = 'assets/Profile.pdf';
const List<String> _documentPath = [
  'assets/Profile.pdf',
  'assets/Profile.pdf',
  'assets/Profile.pdf',
  'assets/Profile.pdf',
  'assets/Profile.pdf',
  'assets/Profile.pdf',
];
const index = 0;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<String> prepareTestPdf(index) async {
    final ByteData bytes =
        await DefaultAssetBundle.of(context).load(_documentPath[index]);
    final Uint8List list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$_documentPath';

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);
    return tempDocumentPath;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> steps = [
      _step1(),
      _step2(),
      _step3(),
      _step4(),
      _step5(),
      _step6(),
    ];
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 100) / 2;
    final double itemWidth = size.width / 2;
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
            'Profiles',
            style: TextStyle(color: Colors.black, fontSize: 35),
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 246, 238, 85),
      body: Container(
        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: SafeArea(
              child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: (itemWidth / itemHeight),
            controller: new ScrollController(keepScrollOffset: false),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: List.generate(6, (index) {
              return steps[index];
            }),
          )),
        ),
      ),
    );
  }

  Widget _step1() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: const Color(0xffffffff),
        border: Border.all(width: 3.0, color: const Color(0xffffffff)),
      ),
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                  "assets/digvijay.jpg",
                ),
              )),
          Text(
            "Digvijay Pawar",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Times new roman',
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                splashColor: Colors.blue[100],
                onPressed: () {
                  prepareTestPdf(0).then((path) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FullPdfViewerScreen(path)),
                    );
                  });
                },
                child: Text(
                  "Open Resume",
                  style: TextStyle(
                      //color: Colors.white,
                      ),
                )),
          )
        ],
      ),
    );
  }

  Widget _step2() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: const Color(0xffffffff),
        border: Border.all(width: 3.0, color: const Color(0xffffffff)),
      ),
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                  "assets/desai.JPG",
                ),
              )),
          Text(
            "Abhishek Desai",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Times new roman',
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                splashColor: Colors.blue[100],
                onPressed: () {
                  prepareTestPdf(1).then((path) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FullPdfViewerScreen(path)),
                    );
                  });
                },
                child: Text(
                  "Open Resume",
                  style: TextStyle(
                      //color: Colors.white,
                      ),
                )),
          )
        ],
      ),
    );
  }

  Widget _step3() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: const Color(0xffffffff),
        border: Border.all(width: 3.0, color: const Color(0xffffffff)),
      ),
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                  "assets/dhanya.JPG",
                ),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
            child: Text(
              "Dhananjay Bagul",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times new roman',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                splashColor: Colors.blue[100],
                onPressed: () {
                  prepareTestPdf(2).then((path) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FullPdfViewerScreen(path)),
                    );
                  });
                },
                child: Text(
                  "Open Resume",
                  style: TextStyle(
                      //color: Colors.white,
                      ),
                )),
          )
        ],
      ),
    );
  }

  Widget _step4() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: const Color(0xffffffff),
        border: Border.all(width: 3.0, color: const Color(0xffffffff)),
      ),
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                  "assets/rohan.JPG",
                ),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
            child: Text(
              "Rohan Amrutkar",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times new roman',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                splashColor: Colors.blue[100],
                onPressed: () {
                  prepareTestPdf(3).then((path) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FullPdfViewerScreen(path)),
                    );
                  });
                },
                child: Text(
                  "Open Resume",
                  style: TextStyle(
                      //color: Colors.white,
                      ),
                )),
          )
        ],
      ),
    );
  }

  Widget _step5() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: const Color(0xffffffff),
        border: Border.all(width: 3.0, color: const Color(0xffffffff)),
      ),
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                  "assets/abhay.JPG",
                ),
              )),
          Text(
            "Abhay Pathare",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Times new roman',
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                splashColor: Colors.blue[100],
                onPressed: () {
                  prepareTestPdf(4).then((path) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FullPdfViewerScreen(path)),
                    );
                  });
                },
                child: Text(
                  "Open Resume",
                  style: TextStyle(
                      //color: Colors.white,
                      ),
                )),
          )
        ],
      ),
    );
  }

  Widget _step6() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: const Color(0xffffffff),
        border: Border.all(width: 3.0, color: const Color(0xffffffff)),
      ),
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                  "assets/amrya.JPG",
                ),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
            child: Text(
              "Abhishek Amritkar",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times new roman',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                splashColor: Colors.blue[100],
                onPressed: () {
                  prepareTestPdf(5).then((path) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FullPdfViewerScreen(path)),
                    );
                  });
                },
                child: Text(
                  "Open Resume",
                  style: TextStyle(
                      //color: Colors.white,
                      ),
                )),
          )
        ],
      ),
    );
  }
}

class FullPdfViewerScreen extends StatelessWidget {
  final String pdfPath;

  FullPdfViewerScreen(this.pdfPath);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text("Document"),
        ),
        path: pdfPath);
  }
}
