import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:covicare_app/database/dboperate.dart';

class RegisterP extends StatelessWidget {
  TextEditingController nm = TextEditingController();
  TextEditingController db = TextEditingController();
  TextEditingController ph = TextEditingController();
  TextEditingController pw = TextEditingController();

  //flag is true when no matching phone number in database
  bool flag=true;
  Future<void> credValid(String phn) async
  {
    // var lock = new Lock();
    // await lock.synchronized(() async {
    //   // database reference variable
    //   final DBRef = await FirebaseDatabase.instance.reference();
    //   await DBRef.child("regn").once().then((DataSnapshot dataSnapShot){
    //     var newdata = dataSnapShot.value;
    //     newdata.forEach((key,values){
    //       // print(values['phone']);
    //       if((values['phone'])==phn){
    //         ph.clear();nm.clear();db.clear();pw.clear();
    //         flag=false;
    //       }
    //     });
    //   });
    //   await Future.delayed(Duration(seconds:3),(){
    //     print("Assigned flag = "+flag.toString()+" in line 33");
    //   });
    // });

    // database reference variable

    final DBRef = await FirebaseDatabase.instance.reference();
    await DBRef.child("regn").once().then((DataSnapshot dataSnapShot){
      var newdata = dataSnapShot.value;
      newdata.forEach((key, values) {
        // print(values['phone']);
        if ((values['phone']) == phn) {
          ph.clear();
          nm.clear();
          db.clear();
          pw.clear();
          flag = false;
        }
      });
    });

    // await Future.delayed(Duration(seconds:0),(){
    //   print("Assigned flag = "+flag.toString()+" in line 33");
    // });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Color(0xff4A7C59)
          ),
          elevation: 24,
          title: Text(
            "Covicare",
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Wind',
              color: Color(0xff4A7C59),
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffFAF3DD),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff4A7C59),
                Color(0xff4A7C59),
                // Color(0xffC8D5B9),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                Text(
                  "Welcome!",
                  style: TextStyle(
                    fontSize: 48,
                    fontFamily: 'Nexa',
                    color: Color(0xffFAF3DD),
                  ),
                ),
                SizedBox(height: 50,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      controller: nm,
                      // maxLength: 10,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xffFAF3DD),
                        filled: true,
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Nexa',
                          color: Color(0x884A7C59),
                        ),
                      ),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.go,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Righteous',
                        color: Color(0xff4A7C59),
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: db,
                      maxLength: 10,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xffFAF3DD),
                        filled: true,
                        hintText: 'DOB',
                        hintStyle: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Nexa',
                          color: Color(0x884A7C59),
                        ),
                      ),
                      keyboardType: TextInputType.datetime,
                      textInputAction: TextInputAction.go,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Righteous',
                        color: Color(0xff4A7C59),
                      ),
                    ),
                    TextField(
                      controller: ph,
                      maxLength: 10,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xffFAF3DD),
                        filled: true,
                        hintText: 'Phone',
                        hintStyle: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Nexa',
                          color: Color(0x884A7C59),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.go,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Righteous',
                        color: Color(0xff4A7C59),
                      ),
                    ),
                    // SizedBox(height: 20,),
                    TextField(
                      controller: pw,
                      maxLength: 20,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xffFAF3DD),
                        filled: true,
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Nexa',
                          color: Color(0x884A7C59),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.go,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Righteous',
                        color: Color(0xff4A7C59),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      onPressed: () async{
                        if(ph.text.length==10 && pw.text.length >= 4 && db.text.length!=0 && nm.text.length!=0){
                          await credValid(ph.text);
                        }
                        else{
                          flag = false;
                        }

                        // print("Received flag = "+flag.toString()+" in line 199");

                        if(flag) {
                          // print("Inside of if");
                          DBOperate.writeRegData(nm.text,db.text,ph.text,pw.text);
                          Navigator.pop(context);
                          return showDialog(context: context, barrierDismissible: false, builder: (context){
                            return AlertDialog(
                              title: Text(
                                "Registration successful!",
                                textAlign: TextAlign.center,
                              ),
                              titleTextStyle: TextStyle(
                                color: Color(0xff4A7C59),
                                fontFamily: 'Nexa',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              content: Icon(
                                Icons.done_outline_outlined,
                                size: 72,
                                color: Color(0xff4A7C59),
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
                              backgroundColor: Color(0xffFAF3DD),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            );
                          }
                          );
                        }
                        else {
                          flag=true;
                          return showDialog(context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    "Try again!",
                                    textAlign: TextAlign.center,
                                  ),
                                  titleTextStyle: TextStyle(
                                    color: Color(0xff4A7C59),
                                    fontFamily: 'Nexa',
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  content: Icon(
                                    Icons.warning_amber_outlined,
                                    size: 72,
                                    color: Color(0xff4A7C59),
                                  ),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {
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
                                  backgroundColor: Color(0xffFAF3DD),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                );
                              }
                          );
                        }
                      },
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Nexa',
                          color: Color(0xff4A7C59),
                        ),
                      ),
                      elevation: 24,
                      padding: EdgeInsets.fromLTRB(45, 14, 45, 13),
                      color: Color(0xffFAF3DD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}