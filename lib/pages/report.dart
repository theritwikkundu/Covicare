import 'package:covicare_app/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportP extends StatefulWidget {

  @override
  _ReportPState createState() => _ReportPState();
}

class _ReportPState extends State<ReportP> {
  void linkop (work) async{
    if (await canLaunch(work)){
      await launch(work);
    }
    else{
      print('Whoops!');
    }
  }

  Widget ReportCard(rpid, urul){
    return Column(
      children: [
        Card(
          color: Color(0xff4A7C59),
          shadowColor: Colors.black,
          elevation: 24,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0)
          ),
          child: Container(
            width: 360,
            padding: EdgeInsets.fromLTRB(22, 16, 22, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Report ID:",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Nexa',
                      color: Color(0xffFAF3DD),
                    )
                ),
                Text(
                    "CVCR"+(rpid.substring(0,6)).toUpperCase(),
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Nexa',
                      color: Color(0xffFAF3DD),
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlineButton(
                      padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
                      borderSide: BorderSide(
                        color: Color(0xffFAF3DD),
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      onPressed: (){
                        linkop(urul);
                      },
                      child: Text(
                          "View",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Nexa',
                            color: Color(0xffFAF3DD),
                          )
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: reports.map((e) => ReportCard(e[0], e[1])).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
