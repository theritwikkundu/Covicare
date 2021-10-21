import 'package:covicare_app/database/dboperate.dart';
import 'package:covicare_app/main.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class EditinfoP extends StatefulWidget {

  @override
  _EditinfoPState createState() => _EditinfoPState();
}

class _EditinfoPState extends State<EditinfoP> {

  TextEditingController nm = TextEditingController();
  TextEditingController db = TextEditingController();
  TextEditingController pw = TextEditingController();
  TextEditingController pw2 = TextEditingController();

  bool credValid(String psw, String psw2)
  {
    if (psw.length>=4 && psw==psw2)
    {
      // ph.clear();
      // pw.clear();
      return true;
    }
    else
    {
      pw.clear();
      pw2.clear();
      return false;
    }
  }

  void updtAc(){
    DBOperate.updateRegData(nm.text,db.text,currentPh,pw.text);
    print("Updating account");
  }

  void dltAc(){
    DBOperate.deleteAccData(currentPh);
    print("Deleted account");
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, '/login');
  }

  void insertText(String insert, TextEditingController controller) {
    final int cursorPos = controller.selection.base.offset;
    controller.value = controller.value.copyWith(
        text: controller.text.replaceRange(max(cursorPos, 0), max(cursorPos, 0), insert),
        selection: TextSelection.fromPosition(TextPosition(offset: max(cursorPos, 0) + insert.length))
    );
  }

  @override
  void initState() {
    super.initState();
    insertText(currentName, nm);
    insertText(currentDob, db);
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
        // resizeToAvoidBottomInset: false,
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
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          alignment: Alignment.center,
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
                // SizedBox(height: 10,),
                Text(
                  "Edit info",
                  style: TextStyle(
                    fontSize: 46,
                    fontFamily: 'Nexa',
                    color: Color(0xffFAF3DD),
                  ),
                ),
                SizedBox(height: 30,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      cursorColor: Color(0x884A7C59),
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
                      cursorColor: Color(0x884A7C59),
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
                      cursorColor: Color(0x884A7C59),
                      obscureText: true,
                      controller: pw,
                      maxLength: 20,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xffFAF3DD),
                        filled: true,
                        hintText: 'New password',
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
                    ),
                    TextField(
                      cursorColor: Color(0x884A7C59),
                      obscureText: true,
                      controller: pw2,
                      maxLength: 20,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xffFAF3DD),
                        filled: true,
                        hintText: 'Confirm password',
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
                    ),
                    SizedBox(height: 30,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlineButton(
                      onPressed: (){
                        return showDialog(context: context, barrierDismissible: false, builder: (context){
                          return AlertDialog(
                            title: Text(
                              "Are you sure you want to delete your account?",
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
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    MaterialButton(
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                          color: Color(0xff4A7C59),
                                          fontFamily: 'Nexa',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      splashColor: Color(0xff4A7C59),
                                    ),
                                    MaterialButton(
                                      onPressed: null,
                                      child: Text(
                                        '     ',
                                        style: TextStyle(
                                          color: Color(0xff4A7C59),
                                          fontFamily: 'Nexa',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      splashColor: Color(0xff4A7C59),
                                    ),
                                    MaterialButton(
                                      onPressed: (){
                                        dltAc();
                                        showDialog(context: context, barrierDismissible: false, builder: (context){
                                          return AlertDialog(
                                            title: Text(
                                              "Sorry, to see you go!",
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
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width,
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
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
                                                      ),
                                                    ]
                                                ),
                                              ),
                                            ],
                                            backgroundColor: Color(0xffFAF3DD),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                          );
                                        });
                                        // Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'Confirm',
                                        style: TextStyle(
                                          color: Color(0xff4A7C59),
                                          fontFamily: 'Nexa',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      splashColor: Color(0xff4A7C59),
                                    ),
                                  ]
                                ),
                              ),
                            ],
                            backgroundColor: Color(0xffFAF3DD),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          );
                        }
                        );
                      },
                      child: Text(
                        "DELETE",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Nexa',
                          color: Color(0xffFAF3DD),
                        ),
                      ),
                      // elevation: 24,
                      padding: EdgeInsets.fromLTRB(32, 14, 32, 13),
                      // color: Color(0xffFAF3DD),
                      borderSide: BorderSide(
                        color: Color(0xff4A7C59),
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    FlatButton(
                      onPressed: (){
                        if(credValid(pw.text, pw2.text)) {
                          updtAc();
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.pushReplacementNamed(context, '/login');
                          return showDialog(context: context, barrierDismissible: false, builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    "Update successfull!",
                                    textAlign: TextAlign.center,
                                  ),
                                  titleTextStyle: TextStyle(
                                    color: Color(0xff4A7C59),
                                    fontFamily: 'Nexa',
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  content: Icon(
                                    Icons.done_outline_sharp,
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
                                    ),
                                  ],
                                  backgroundColor: Color(0xffFAF3DD),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                );
                              }
                            );
                          }
                        else
                          {
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
                                      ),
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
                        "UPDATE",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Nexa',
                          color: Color(0xff4A7C59),
                        ),
                      ),
                      // elevation: 24,
                      padding: EdgeInsets.fromLTRB(32, 14, 32, 13),
                      color: Color(0xffFAF3DD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
