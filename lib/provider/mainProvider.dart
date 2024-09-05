import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProvider extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController RegisterNameController=TextEditingController();
  TextEditingController RegisterPhoneController=TextEditingController();
  TextEditingController RegisterEmailController=TextEditingController();
  TextEditingController RegisterPasswordController=TextEditingController();

  Future<void> addRegistration() async {
    String id=DateTime.now().microsecondsSinceEpoch.toString();
    HashMap<String,dynamic>registermap=HashMap();
    registermap["REGISTER_ID"]=id;
    registermap["REGISTER_NAME"]=RegisterNameController.text;
    registermap["REGISTER_PHONENUMBER"]=RegisterPhoneController.text;
    registermap["REGISTER_EMAIL"]=RegisterEmailController.text;
    registermap["REGISTER_PASSWORD"]=RegisterPasswordController.text;
    db.collection("SAFENET").doc(id).set(registermap);
    SharedPreferences  prefs = await SharedPreferences.getInstance();
    await prefs.setString("REGISTER_NAME", RegisterNameController.text);
    await prefs.setString("REGISTER_PHONENUMBER", RegisterPhoneController.text);
    await prefs.setString("REGISTER_EMAIL", RegisterPhoneController.text);
    await prefs.setString("REGISTER_PASSWORD", RegisterPasswordController.text);
    notifyListeners();

  }
}