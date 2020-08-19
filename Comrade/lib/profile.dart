import 'package:Comrade/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
        margin: EdgeInsets.all(50),
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          // width: 294.0 * 1.5,
          // height: 268.0 * 1.5,
          child: SafeArea(
              child: new Swiper(
            itemHeight: 268.0 * 1.5,
            itemWidth: 294.0 * 1.5,
            //viewportFraction: 0.8,
            itemBuilder: (BuildContext context, int index) {
              return steps[index];
            },
            autoplay: true,
            scale: 0.9,
            itemCount: steps.length,
            layout: SwiperLayout.STACK,
            pagination: SwiperPagination(
              alignment: Alignment(0, 1.0),
            ),
            control: new SwiperControl(),
          )),
        ),
      ),
    );
  }

  Widget _step1() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(94.0),
          bottomRight: Radius.circular(94.0),
          bottomLeft: Radius.circular(94.0),
        ),
        color: const Color(0xffffffff),
        border: Border.all(width: 3.0, color: const Color(0xffffffff)),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Image.asset(
              "assets/digvijay.jpg",
              height: 200 * 1.3,
              width: 150 * 1.3,
            ),
          ),
          Text(
            "Digvijay Pawar",
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Times new roman',
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget _step2() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(94.0),
          bottomRight: Radius.circular(94.0),
          bottomLeft: Radius.circular(94.0),
        ),
        color: const Color(0xffffffff),
        border: Border.all(width: 3.0, color: const Color(0xffffffff)),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Image.asset(
              "assets/desai.jpg",
              height: 200 * 1.3,
              width: 150 * 1.3,
            ),
          ),
          Text(
            "Abhishek Desai",
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Times new roman',
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget _step3() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(94.0),
          bottomRight: Radius.circular(94.0),
          bottomLeft: Radius.circular(94.0),
        ),
        color: const Color(0xffffffff),
        border: Border.all(width: 3.0, color: const Color(0xffffffff)),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Image.asset(
              "assets/dhanya.jpg",
              height: 200 * 1.3,
              width: 150 * 1.3,
            ),
          ),
          Text(
            "Dhananjay Bagul",
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Times new roman',
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget _step4() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(94.0),
          bottomRight: Radius.circular(94.0),
          bottomLeft: Radius.circular(94.0),
        ),
        color: const Color(0xffffffff),
        border: Border.all(width: 3.0, color: const Color(0xffffffff)),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Image.asset(
              "assets/rohan.jpg",
              height: 200 * 1.3,
              width: 150 * 1.3,
            ),
          ),
          Text(
            "Rohan Amrutkar",
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Times new roman',
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget _step5() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(94.0),
          bottomRight: Radius.circular(94.0),
          bottomLeft: Radius.circular(94.0),
        ),
        color: const Color(0xffffffff),
        border: Border.all(width: 3.0, color: const Color(0xffffffff)),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Image.asset(
              "assets/abhay.jpg",
              height: 200 * 1.3,
              width: 150 * 1.3,
            ),
          ),
          Text(
            "Abhay Pathare",
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Times new roman',
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget _step6() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(94.0),
          bottomRight: Radius.circular(94.0),
          bottomLeft: Radius.circular(94.0),
        ),
        color: const Color(0xffffffff),
        border: Border.all(width: 3.0, color: const Color(0xffffffff)),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Image.asset(
              "assets/amrya.jpg",
              height: 200 * 1.3,
              width: 150 * 1.3,
            ),
          ),
          Text(
            "Abhishek Amritkar",
            style: TextStyle(
              fontSize: 27,
              fontFamily: 'Times new roman',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
