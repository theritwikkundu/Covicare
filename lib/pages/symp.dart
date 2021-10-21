import 'package:flutter/material.dart';

class SympP extends StatefulWidget {
  @override
  _SympPState createState() => _SympPState();
}

class _SympPState extends State<SympP> {

  bool s01 = false;
  bool s02 = false;
  bool s03 = false;
  bool s04 = false;
  bool s05 = false;
  bool s06 = false;
  bool s07 = false;
  bool s08 = false;
  bool s09 = false;
  bool s10 = false;
  int stot = 0;

  /*scores for determining seriousness of COVID in symptoms option*/
  // 02=fever
  // 02=dry cough
  // 01=tiredness
  // 01=aches and pains
  // 01=sore throat
  // 01=diarrhoea
  // 01=headache
  // 10=loss of taste or smell
  // 01=a rash on skin, or discolouration of fingers or toes
  // 05=difficulty breathing or shortness of breath
  //
  // if total>=10 then COVID-19

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 20,),
              Column(
                children: [
                  CheckboxListTile(
                    title: Text(
                      "Fever",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Nexa',
                        color: Color(0xff4A7C59),
                      ),
                    ),
                    value: s01,
                    onChanged: (bool value){
                      setState(() {
                        s01=value;
                        if (s01==true)
                          stot+=2;
                        else
                          stot-=2;
                        print(stot);
                      });
                      },
                      activeColor: Color(0xff4A7C59),
                    ),
                  CheckboxListTile(
                      title: Text(
                        "Dry cough",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Nexa',
                          color: Color(0xff4A7C59),
                        ),
                      ),
                      value: s02,
                      onChanged: (bool value){
                        setState(() {
                          s02=value;
                          if (s02==true)
                            stot+=2;
                          else
                            stot-=2;
                          print(stot);
                        });
                      },
                    activeColor: Color(0xff4A7C59),
                  ),
                  CheckboxListTile(
                      title: Text(
                        "Tiredness",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Nexa',
                          color: Color(0xff4A7C59),
                        ),
                      ),
                      value: s03,
                      onChanged: (bool value){
                        setState(() {
                          s03=value;
                          if (s03==true)
                            stot+=1;
                          else
                            stot-=1;
                          print(stot);
                        });
                      },
                    activeColor: Color(0xff4A7C59),
                  ),
                  CheckboxListTile(
                      title: Text(
                        "Aches and pains",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Nexa',
                          color: Color(0xff4A7C59),
                        ),
                      ),
                      value: s04,
                      onChanged: (bool value){
                        setState(() {
                          s04=value;
                          if (s04==true)
                            stot+=1;
                          else
                            stot-=1;
                          print(stot);
                        });
                      },
                    activeColor: Color(0xff4A7C59),
                  ),
                  CheckboxListTile(
                      title: Text(
                        "Sore throat",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Nexa',
                          color: Color(0xff4A7C59),
                        ),
                      ),
                      value: s05,
                      onChanged: (bool value){
                        setState(() {
                          s05=value;
                          if (s05==true)
                            stot+=1;
                          else
                            stot-=1;
                          print(stot);
                        });
                      },
                    activeColor: Color(0xff4A7C59),
                  ),
                  CheckboxListTile(
                      title: Text(
                        "Diarrhoea",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Nexa',
                          color: Color(0xff4A7C59),
                        ),
                      ),
                      value: s06,
                      onChanged: (bool value){
                        setState(() {
                          s06=value;
                          if (s06==true)
                            stot+=1;
                          else
                            stot-=1;
                          print(stot);
                        });
                      },
                    activeColor: Color(0xff4A7C59),
                  ),
                  CheckboxListTile(
                      title: Text(
                        "Headache",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Nexa',
                          color: Color(0xff4A7C59),
                        ),
                      ),
                      value: s07,
                      onChanged: (bool value){
                        setState(() {
                          s07=value;
                          if (s07==true)
                            stot+=1;
                          else
                            stot-=1;
                          print(stot);
                        });
                      },
                    activeColor: Color(0xff4A7C59),
                  ),
                  CheckboxListTile(
                      title: Text(
                        "Loss of taste or smell",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Nexa',
                          color: Color(0xff4A7C59),
                        ),
                      ),
                      value: s08,
                      onChanged: (bool value){
                        setState(() {
                          s08=value;
                          if (s08==true)
                            stot+=10;
                          else
                            stot-=10;
                          print(stot);
                        });
                      },
                    activeColor: Color(0xff4A7C59),
                  ),
                  CheckboxListTile(
                      title: Text(
                        "Skin rash, or discolouration of fingers or toes",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Nexa',
                          color: Color(0xff4A7C59),
                        ),
                      ),
                      value: s09,
                      onChanged: (bool value){
                        setState(() {
                          s09=value;
                          if (s09==true)
                            stot+=1;
                          else
                            stot-=1;
                          print(stot);
                        });
                      },
                    activeColor: Color(0xff4A7C59),
                  ),
                  CheckboxListTile(
                      title: Text(
                        "Shortness of breath",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Nexa',
                          color: Color(0xff4A7C59),
                        ),
                      ),
                      value: s10,
                      onChanged: (bool value){
                        setState(() {
                          s10=value;
                          if (s10==true)
                            stot+=1;
                          else
                            stot-=1;
                          print(stot);
                        });
                      },
                    activeColor: Color(0xff4A7C59),
                  ),
                ],
              ),
              SizedBox(height: 25,),
              RaisedButton(
                onPressed: (){
                  if(stot>=10)
                    return showDialog(context: context, barrierDismissible: false, builder: (context){
                      return AlertDialog(
                        title: Text(
                          "It's better to get tested!",
                          textAlign: TextAlign.center,
                        ),
                        titleTextStyle: TextStyle(
                          color: Color(0xff4A7C59),
                          fontFamily: 'Nexa',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
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
                  else
                    return showDialog(context: context, barrierDismissible: false, builder: (context){
                      return AlertDialog(
                        title: Text(
                          "Seems you are fine!",
                          textAlign: TextAlign.center,
                        ),
                        titleTextStyle: TextStyle(
                          color: Color(0xff4A7C59),
                          fontFamily: 'Nexa',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
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
                  "CHECK",
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
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
