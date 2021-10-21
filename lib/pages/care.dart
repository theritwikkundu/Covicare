import 'package:flutter/material.dart';

class CareP extends StatelessWidget {
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
        padding: EdgeInsets.fromLTRB(20, 70, 20, 30),
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
        child: Column(
          children: [
            RaisedButton(
              elevation: 24,
              padding: EdgeInsets.fromLTRB(32, 12, 32, 12),
              child: SizedBox(
                // height: 54,
                width: 260,
                child: Text(
                  "Symptom analysis",
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Nexa',
                    color: Colors.white,
                    // fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              onPressed: (){Navigator.pushNamed(context, '/symp');},
              color: Color(0xff4A7C59),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              elevation: 24,
              padding: EdgeInsets.fromLTRB(32, 12, 32, 12),
              child: SizedBox(
                // height: 54,
                width: 260,
                child: Text(
                  "Book appointment",
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Nexa',
                    color: Colors.white,
                    // fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              onPressed: (){Navigator.pushNamed(context, '/apmt');},
              color: Color(0xff4A7C59),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              elevation: 24,
              padding: EdgeInsets.fromLTRB(32, 12, 32, 12),
              child: SizedBox(
                height: 28,
                width: 260,
                child: Text(
                  "Report",
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Nexa',
                    color: Colors.white,
                    // fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              onPressed: (){Navigator.pushNamed(context, '/report');},
              color: Color(0xff4A7C59),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
