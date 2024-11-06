import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/add_food.dart';
import 'package:fooddelivery/admin/admin_login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fooddelivery/pages/payment_summary/my_google_pay.dart';
void main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: AdminLogin()
      // MyGooglePay()
      // AddFood()
      ,
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

