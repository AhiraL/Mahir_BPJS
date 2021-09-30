import 'package:flutter/material.dart';
import 'package:mahir_bpjs/home_page.dart';
import 'package:mahir_bpjs/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool login = false;
  TextEditingController Cont1 = new TextEditingController();
  TextEditingController Cont2 = new TextEditingController();
  String textholder = '';

  prefLogin(String username, String password) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', username);
  }

  @override
  Widget build(BuildContext context) {
    final logo = Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: new Image.asset('assets/images/img_splash_header.jpeg'),
    );

    final email = TextFormField(
      controller: Cont1,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          setState(() {
            textholder = '';
          });
          return 'Email wajib diisi';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      controller: Cont2,
      autofocus: false,
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          setState(() {
            textholder = '';
          });
          return 'Password wajib diisi';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final validation = Text(
      textholder,
      style: TextStyle(color: Colors.red),
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
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if(Cont1.text == 'mahir' && Cont2.text == '123') {
                // Navigator.of(context).pushNamed(HomePage.tag);
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
                  return HomePage();
                }));
                prefLogin(Cont1.text, Cont2.text);
              } else {
                setState(() {
                  textholder = 'Email/Password Salah!';
                });
              }
            }
            prefLogin(Cont1.text, Cont2.text);
          },
          child: Text(
            "Login",
            style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 18,
            ),
          ),
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    final daftarLabel = FlatButton(
      child: Text(
        'Daftar Akun',
        style: TextStyle(color: Colors.black54),
        textAlign: TextAlign.right,
      ),
      onPressed: () {Navigator.of(context).pushNamed(SplashPage.tag);},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            validation,
            forgotLabel,
            daftarLabel,
          ],
        ),
      ),
      )
    );
  }
}