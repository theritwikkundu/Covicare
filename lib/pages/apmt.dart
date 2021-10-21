import 'package:covicare_app/database/dboperate.dart';
import 'package:covicare_app/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ApmtP extends StatefulWidget {
  @override
  _ApmtPState createState() => _ApmtPState();
}

class _ApmtPState extends State<ApmtP> {

  String cityChoice;
  String slotChoice;
  String typeChoice;
  String dateChoice = "Date";
  DateTime dtTom = DateTime.now().add(const Duration(days: 1));
  DateTime dtPicked = DateTime.now();

  List typeList = ["Consultation", "Testing",];
  List cityList = ["Delhi", "Pune", "Mumbai", "Bangalore", "Chennai", "Kolkata", "Thane", "Nagpur",];
  List slotList = ["10 AM - 11 AM", "11 AM - 12 PM", "12 PM - 1 PM", "1 PM - 2 PM", "2 PM - 3 PM", "3 PM - 4 PM", "4 PM - 5 PM", "5 PM - 6 PM", "6 PM - 7 PM", "7 PM - 8 PM", "8 PM - 9 PM",];

  bool flag = true;
  Future<void> credValid(String typ, String cty, String dtt, String slt) async
  {
    final DBRef = await FirebaseDatabase.instance.reference();
    await DBRef.child("apmt").once().then((DataSnapshot dataSnapShot){
      var newdata = dataSnapShot.value;
      newdata.forEach((key,values){
        if((values['type'])==typ && (values['city'])==cty && (values['date'])==dtt && (values['slot'])==slt){
          flag=false;
        }
      });
    });
  }

  void bookApmt(String typ, String cty, String dtt, String slt){
    DBOperate.writeApmtData(currentPh, typ, cty, dtt, slt);
    print(cityChoice + " " + dateChoice + " " + slotChoice);
  }

  Future<Null> selectTimPicker(BuildContext context) async {
    dtPicked = await showDatePicker(
        context: context,
        initialDate: dtTom,
        firstDate: dtTom,
        lastDate: DateTime(2030),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light().copyWith(
                primary: Color(0xff4A7C59), //head bar
                onPrimary: Color(0xffFAF3DD), //heading text
                onSurface: Color(0xff4A7C59), //content text
              ),
            ),
            child: child,
          );
        }
    );
    if (dtPicked!=null)
      {
        setState(() {
          String dd, mm, yyyy;
          dd = dtPicked.day.toString().length<2? "0"+dtPicked.day.toString() : dtPicked.day.toString();
          mm = dtPicked.month.toString().length<2? "0"+dtPicked.month.toString() : dtPicked.month.toString();
          yyyy = dtPicked.year.toString().length<2? "0"+dtPicked.year.toString() : dtPicked.year.toString();
          dateChoice = dd+"-"+mm+"-"+yyyy;
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        padding: EdgeInsets.fromLTRB(20, 50, 20, 30),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Text(
            //   "Appointments",
            //   style: TextStyle(
            //     fontSize: 48,
            //     fontFamily: 'Wind',
            //     color: Color(0xff4A7C59),
            //   ),
            // ),
            // SizedBox(
            //   // height: 88,
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    color: Color(0xffFAF3DD),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: DropdownButton(
                    hint: Container(
                      width: 260,
                      child: Text(
                        "Type",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Nexa',
                          color: Color(0xff4A7C59),
                        ),
                      ),
                    ),
                    icon: Icon(Icons.arrow_drop_down_sharp),
                    iconSize: 36,
                    iconEnabledColor: Color(0xff4A7C59),
                    dropdownColor: Color(0xffFAF3DD),
                    value: typeChoice,
                    onChanged: (slotNew){
                      setState(() {
                        typeChoice = slotNew;
                      });
                    },
                    items: typeList.map((typeName){
                      return DropdownMenuItem(
                          value: typeName,
                          child: Text(
                            typeName,
                            style: TextStyle(
                              fontSize: 26,
                              fontFamily: 'Nexa',
                              color: Color(0xff4A7C59),
                            ),
                          )
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                    height: 32,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    color: Color(0xffFAF3DD),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: DropdownButton(
                    hint: Container(
                      width: 260,
                      child: Text(
                        "City",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Nexa',
                          color: Color(0xff4A7C59),
                        ),
                      ),
                    ),
                    icon: Icon(Icons.arrow_drop_down_sharp),
                    iconSize: 36,
                    iconEnabledColor: Color(0xff4A7C59),
                    dropdownColor: Color(0xffFAF3DD),
                    value: cityChoice,
                    onChanged: (cityNew){
                      setState(() {
                        cityChoice = cityNew;
                      });
                    },
                    items: cityList.map((cityName){
                      return DropdownMenuItem(
                          value: cityName,
                          child: Text(
                            cityName,
                            style: TextStyle(
                              fontSize: 26,
                              fontFamily: 'Nexa',
                              color: Color(0xff4A7C59),
                            ),
                          )
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                      color: Color(0xffFAF3DD),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: InkWell(
                      onTap: (){
                        onTap: selectTimPicker(context);
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                        alignment: Alignment.center,
                        height: 54,
                        width: 298,
                        // width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              dateChoice,
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Nexa',
                                color: Color(0xff4A7C59),
                              ),
                            ),
                            Icon(
                              Icons.calendar_today_sharp,
                              size: 22,
                              color: Color(0xff4A7C59),
                            )
                          ],
                        ),
                      ),
                    )
                ),
                SizedBox(
                    height: 32,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    color: Color(0xffFAF3DD),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: DropdownButton(
                    hint: Container(
                      width: 260,
                      child: Text(
                        "Slot",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Nexa',
                          color: Color(0xff4A7C59),
                        ),
                      ),
                    ),
                    icon: Icon(Icons.arrow_drop_down_sharp),
                    iconSize: 36,
                    iconEnabledColor: Color(0xff4A7C59),
                    dropdownColor: Color(0xffFAF3DD),
                    value: slotChoice,
                    onChanged: (slotNew){
                      setState(() {
                        slotChoice = slotNew;
                      });
                    },
                    items: slotList.map((slotName){
                      return DropdownMenuItem(
                          value: slotName,
                          child: Text(
                            slotName,
                            style: TextStyle(
                              fontSize: 26,
                              fontFamily: 'Nexa',
                              color: Color(0xff4A7C59),
                            ),
                          )
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(
              // height: 96,
            ),
            RaisedButton(
              onPressed: () async{
                await credValid(typeChoice, cityChoice, dateChoice, slotChoice);

                if(flag) {
                  bookApmt(typeChoice, cityChoice, dateChoice, slotChoice);
                  return showDialog(context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Booking successful!",
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
                              onPressed: () {
                                Navigator.of(context).pop();
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
                      });
                }
                else
                  return showDialog(context: context, barrierDismissible: false, builder: (context){
                    return AlertDialog(
                      title: Text(
                        "Try another slot!",
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
                "BOOK",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Nexa',
                  color: Color(0xffFAF3DD),
                ),
              ),
              elevation: 24,
              padding: EdgeInsets.fromLTRB(45, 14, 45, 13),
              color: Color(0xff4A7C59),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
