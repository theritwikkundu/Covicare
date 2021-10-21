import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:covicare_app/main.dart';

class LoginP extends StatelessWidget {

  TextEditingController id = TextEditingController();
  TextEditingController pw = TextEditingController();

  //flag is true when no matching phone number in database
  bool loginFlag=false;
  Future<void> credValid(String ids, String pws) async
  {
    final DBRef = await FirebaseDatabase.instance.reference();
    await DBRef.child("regn").once().then((DataSnapshot dataSnapShot){
      var newdata = dataSnapShot.value;
      newdata.forEach((key,values){
        print(values['phone']);
        if((values['phone'])==ids && (values['pass'])==pws){
          currentPh = values['phone'];
          currentName = values['name'];
          currentPass = values['pass'];
          currentDob = values['dob'];

          loginFlag=true;
        }
      });
      id.clear();pw.clear();
    });
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
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          alignment: Alignment.topCenter,
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 120,),
                Text(
                  "Covicare",
                  // style: GoogleFonts.pacifico(),
                  style: TextStyle(
                    fontSize: 65,
                    fontFamily: 'Wind',
                    color: Color(0xff4A7C59),
                  ),
                ),
                SizedBox(height: 2,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 75,),
                    TextField(
                      controller: id,
                      maxLength: 10,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0x99ffffff),
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
                      cursorColor: Color(0xff4A7C59),
                    ),
                    // SizedBox(height: 20,),
                    TextField(
                      controller: pw,
                      maxLength: 20,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0x99ffffff),
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
                      cursorColor: Color(0xff4A7C59),
                    ),
                    SizedBox(height: 50,),
                    RaisedButton(
                      onPressed: () async{
                        await credValid(id.text,pw.text);

                        if(loginFlag) {
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                        else
                          return showDialog(context: context, barrierDismissible: false, builder: (context){
                            return AlertDialog(
                              title: Text(
                                "Invalid Credentials!",
                                textAlign: TextAlign.center,
                              ),
                              titleTextStyle: TextStyle(
                                color: Color(0xff4A7C59),
                                fontFamily: 'Nexa',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              content: Icon(
                                Icons.warning_amber_rounded,
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
                          });
                        },
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Nexa',
                          color: Color(0xffFAF3DD),
                        ),
                      ),
                      elevation: 24,
                      padding: EdgeInsets.fromLTRB(65, 14, 65, 13),
                      color: Color(0xff4A7C59),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 0,),
                SizedBox(height: 30,),
                FlatButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/register');
                      id.clear();pw.clear();
                    },
                    child: Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Nexa',
                          color: Color(0xff4A7C59),
                        )
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
