import 'package:covicare_app/pages/editinfo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:covicare_app/pages/apmt.dart';
import 'package:covicare_app/pages/care.dart';
import 'package:covicare_app/pages/loader.dart';
import 'package:covicare_app/pages/login.dart';
import 'package:covicare_app/pages/pinfo.dart';
import 'package:covicare_app/pages/register.dart';
import 'package:covicare_app/pages/report.dart';
import 'package:covicare_app/pages/stats.dart';
import 'package:covicare_app/pages/symp.dart';

// global variables
String currentPh="default phone";
String currentName="default name";
String currentPass="default pass";
String currentDob="default dob";

List<List> reports=new List();

//global function
Future<void> getReports() async
{
  final DBRef = FirebaseDatabase.instance.reference();
  await DBRef.child("rpt").once().then((DataSnapshot dataSnapShot){
    var newdata = dataSnapShot.value;
    newdata.forEach((key,values){
      if((values['phone'])==currentPh){
        List<String> temp=[key,values['url']];
        print(key+" "+values['url']);
        reports.add(temp);
      }
    });
  });
}
void clearAll(){
  currentPh="default phone";
  currentName="default name";
  currentPass="default pass";
  currentDob="default dob";
  reports=new List();
}

void main() {
  // version compliance
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    // initialRoute: '/login',
    routes: {
      '/': (context) => LoadingP(),
      '/home': (context) => HomeP(),
      '/care': (context) => CareP(),
      '/login': (context) => LoginP(),
      '/stats': (context) => StatsP(),
      '/register': (context) => RegisterP(),
      '/info': (context) => PinfoP(),
      '/report': (context) => ReportP(),
      '/symp': (context) => SympP(),
      '/apmt': (context) => ApmtP(),
      '/editinfo': (context) => EditinfoP(),
    },
  ));
}

class HomeP extends StatelessWidget {
  // database reference string
  final DBRef = FirebaseDatabase.instance.reference();

  void linkop (work) async{
    if (await canLaunch(work)){
      await launch(work);
    }
    else{
      print('Whoops!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                height: 28,
                width: 260,
                child: Text(
                  "Statistics",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Nexa',
                    color: Colors.white,
                    // fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/stats');
              },
              color: Color(0xff4A7C59),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
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
                  "Check symptoms",
                  style: TextStyle(
                    fontSize: 25,
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
                borderRadius: BorderRadius.circular(0),
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
                    fontSize: 25,
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
                borderRadius: BorderRadius.circular(0),
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
                  "Reports",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Nexa',
                    color: Colors.white,
                    // fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              onPressed: () async{
                reports = await new List();
                await getReports();
                Navigator.pushNamed(context, '/report');
              },
              color: Color(0xff4A7C59),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ],
        ),
      ),
      drawer: Container(
        width: 150,
        padding: EdgeInsets.fromLTRB(10, 42, 10, 36),
        alignment: Alignment.topCenter,
        color: Color(0xff4A7C59),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.person_pin_rounded,
                    size: 108,
                    color: Colors.white,
                  ),
                  radius: 56,
                  backgroundColor: Color(0x00000000),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: 170,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Nexa',
                          color: Colors.white,
                          // fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        currentName,
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Nexa',
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 30,),
                      OutlineButton(
                        onPressed: (){Navigator.pushNamed(context, '/info');},
                        child: SizedBox(
                          width: 140,
                          child: Text(
                            "My Info",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Nexa',
                              color: Color(0xffffffff),
                              // fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                OutlineButton(
                  onPressed: (){
                    linkop('mailto:ritwik.kundu2019@vitstudent.ac.in');
                  },
                  child: SizedBox(
                    width: 140,
                    child: Text(
                      "FEEDBACK",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Nexa',
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w600
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    clearAll();
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: SizedBox(
                    width: 140,
                    child: Text(
                      "LOGOUT",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Nexa',
                          color: Color(0xff4A7C59),
                          fontWeight: FontWeight.w600
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawerScrimColor: Color(0x55FAF3DD),
      floatingActionButton: Container(
        width: 70,
        height: 70,
        alignment: Alignment.topLeft,
        child: FloatingActionButton(
          elevation: 100,
          onPressed: (){
            return showDialog(context: context, barrierDismissible: false, builder: (context){
              return AlertDialog(
                title: Text(
                  "About the app",
                  textAlign: TextAlign.center,
                ),
                titleTextStyle: TextStyle(
                  color: Color(0xff4A7C59),
                  fontFamily: 'Nexa',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                content: SingleChildScrollView(
                  child: Text(
                    "This app aims to present a comprehensive platform to provide an all-encompassing pandemic protection solution for people.\nUsers can know about the confirmed, recovered, active and death cases around the world to help them understand the spread of the virus. The care option of the app, which people can use to not only know about potential health risks, symptoms of COVID-19 and measures to be undertaken when facing certain symptoms but also to book appointments and receive their reports directly through the app. Since the system will be keeping a track of daily cases recorded in each country, it also has the option that helps people in deciding for their future travel plans.\nCovicare aims to assist the users in keeping safe and healthy in this pandemic in a hassle-free manner.\n\nDeveloper:\nRitwik Kundu",
                    style: TextStyle(
                      fontFamily: 'Nexa',
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                actions: [
                  MaterialButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Close',
                      style: TextStyle(
                          color: Color(0xff4A7C59),
                          fontFamily: 'Nexa',
                          fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    splashColor: Color(0xff4A7C59),
                  )
                ],
                backgroundColor: Color(0xffC8D5B9),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              );
            });
          },

          /*database handler*/
          // onPressed: (){
          //   // deleteData();
          //   // writeData();
          //   // readData();
          // },
          backgroundColor: Color(0x004A7C59),
          // splashColor: Color(0x004A7C59),
          // shape: ,
          child: Icon(
            Icons.info_sharp,
            size: 60,
            color: Color(0xff4A7C59),
          ),
        ),
      ),
    );
  }

  /*database handler*/
//
//  final DBRef = await FirebaseDatabase.instance.reference();
//   void readData(){
//     DBRef.child("regn").once().then((DataSnapshot dataSnapShot){
//       var newdata = dataSnapShot.value;
//       // var key = newdata.keys.elementAt("1234");
//       newdata.forEach((key, values){
//         print(values['phone']);
//       });
//     });
//     print("data read");
//   }
//   void writeData(){
//
//     DBRef.child("apmt").push().set({
//       'phone': "9685",
//       'type': "Testing",
//       'city': "Kolkata",
//       'date': "26/02/2019",
//       'slot': "12"
//     });
//   }
//
//   void updateData(){
//     DBRef.child("1").update({
//       'data':'This is an updated value'
//     });
//     print("data update");
//   }
//
//   void deleteData(){
//     DBRef.child("regn").remove();
//     print("data delete");
//   }

}