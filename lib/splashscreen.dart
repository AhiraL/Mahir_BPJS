import 'package:flutter/material.dart';
import 'package:mahir_bpjs/home_page.dart';
import 'package:mahir_bpjs/login_page.dart';
import 'package:mahir_bpjs/new_member.dart';
import 'package:mahir_bpjs/new_user.dart';


class SplashPage extends StatefulWidget {
  static String tag = 'splash-page';
  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State <SplashPage> {

  @override
  Widget build(BuildContext context) {
    final logo = Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: new Image.asset('assets/images/img_splash_header.jpeg'),
    );

    final choose = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150.0,
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              InkWell(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset('assets/icons/icon_new_member.jpeg'),
                ),
                onTap: () {
                  {Navigator.of(context).pushNamed(UserPage.tag);};
                },
              ),
              Text(
                'Pendaftaran Peserta Baru',
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          width: 150.0,
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              InkWell(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset('assets/icons/icon_new_user.jpeg'),
              ),
              onTap: () {
                {Navigator.of(context).pushNamed(UserPage.tag);};
              },
            ),
              Text(
                'Pendaftaran User Baru',
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        height: 50,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.lightBlueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {Navigator.of(context).pushNamed(LoginPage.tag);},
          child: Text(
            "SIGN IN",
            style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 18,
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            choose,
            SizedBox(height: 50.0),
            loginButton,
          ],
        ),
      ),
    );

  }


}