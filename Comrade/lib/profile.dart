import 'package:Comrade/sidebar.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
          // width: 294.0 * 1.5,
          // height: 268.0 * 1.5,
          child: SafeArea(
              child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: (itemWidth / itemHeight),
            controller: new ScrollController(keepScrollOffset: false),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            // Generate 100 widgets that display their index in the List.
            children: List.generate(6, (index) {
              return steps[index];
            }),
          )
              //     child: new Swiper(
              //   itemHeight: 268.0 * 1.5,
              //   itemWidth: 294.0 * 1.5,
              //   //viewportFraction: 0.8,
              //   itemBuilder: (BuildContext context, int index) {
              //     return steps[index];
              //   },
              //   autoplay: true,
              //   scale: 0.9,
              //   itemCount: steps.length,
              //   layout: SwiperLayout.STACK,
              //   pagination: SwiperPagination(
              //     alignment: Alignment(0, 1.0),
              //   ),
              //   control: new SwiperControl(),
              // )
              ),
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
                onPressed: () {},
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
                  "assets/desai.jpg",
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
                onPressed: () {},
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
                  "assets/dhanya.jpg",
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
                onPressed: () {},
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
                  "assets/rohan.jpg",
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
                onPressed: () {},
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
                  "assets/abhay.jpg",
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
                onPressed: () {},
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
                  "assets/amrya.jpg",
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
                onPressed: () {},
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
