import 'package:firebase_database/firebase_database.dart';

class DBOperate{

  /*function to read data*/
  static bool readData(String phn){
    // database reference string
    final DBRef = FirebaseDatabase.instance.reference();
    bool fl = false;
    print("Phone: "+phn);
    DBRef.child("regn").once().then((DataSnapshot dataSnapShot){
      var newdata = dataSnapShot.value;
      // var key = newdata.keys.elementAt("1234");
      newdata.forEach((key, values){print(values['phone']);if((values['phone'])==phn){fl = true;}});
      return fl;
    });
  }

  /*function to write registration data*/
  static void writeRegData(String name, String dob, String phone, String password){
    // database reference string
    final DBRef = FirebaseDatabase.instance.reference();
    DBRef.child("regn").child(phone).set({
      'phone': phone,
      'name': name,
      'dob': dob,
      'pass': password
    });
    print("data created");
  }

  /*function to update data on edit info*/
  static void updateRegData(String name, String dob, String phone, String password){
    // database reference string
    final DBRef = FirebaseDatabase.instance.reference();
    DBRef.child("regn").child(phone).update({
      'name': name,
      'dob': dob,
      'pass': password
    });
    print("data updated");
  }

  /*function to delete data on account deletion*/
  static void deleteAccData(String phone){
    // database reference string
    final DBRef = FirebaseDatabase.instance.reference();
    DBRef.child("regn").child(phone).remove();
    print("data deleted");
  }

  /*function to write appointment data*/
  static void writeApmtData(String phone, String type, String city, String date, String slot){
    // database reference string
    final DBRef = FirebaseDatabase.instance.reference();
    DBRef.child("apmt").push().set({
      'phone': phone,
      'type': type,
      'city': city,
      'date': date,
      'slot': slot
    });
    print("data created");
  }
}