import 'package:flutter/material.dart';
import 'package:mahir_bpjs/home_page.dart';
import 'package:mahir_bpjs/login_page.dart';
import 'package:mahir_bpjs/splashscreen.dart';
import 'package:mahir_bpjs/new_member.dart';
import 'package:mahir_bpjs/new_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    SplashPage.tag: (context) => SplashPage(),
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    MemberPage.tag: (context) => MemberPage(),
    UserPage.tag: (context) => UserPage(),
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BPJSKU',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        fontFamily: 'Nunito',
      ),
      home: SplashPage(),
      routes: routes,
    );
  }


}
