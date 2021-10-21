import 'package:covicare_app/screens/country.dart';
import 'package:covicare_app/screens/global.dart';
import 'package:flutter/material.dart';


class StatsP extends StatefulWidget {
  @override
  _StatsPState createState() => _StatsPState();
}

class _StatsPState extends State<StatsP> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 24,
          title: Text(
            "Covicare",
            style: TextStyle(
              fontSize: 28,
              fontFamily: 'Wind',
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff4A7C59),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.blur_circular, color: Colors.white,),),
              Tab(icon: Icon(Icons.flag, color: Colors.white,),),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffFAF3DD),
                Color(0xffC8D5B9),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            ),
          ),
          alignment: Alignment.center,
          child: TabBarView(
            children: [
              Global(),
              Country(),
            ],
          ),
        ),
      ),
    );
  }
}
