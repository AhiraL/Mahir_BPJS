import 'package:flutter/material.dart';
import 'package:mahir_bpjs/list_berita.dart';
import 'package:mahir_bpjs/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentScreen = 0;
  String temp = '';
  getPrefLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState( () {temp = (prefs.getString('username') ?? 'gk ada'); } );
  }
  dialogPop(){
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Konfirmasi Logout"),
            content: Text("Yakin Logout?"),
            actions: [
              ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    await pref.clear();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
                      return LoginPage();
                    }));
                  },
                  child: Text("Ya")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // _isBack = false;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text("Tidak")),
            ],
          );
        });
  }
  @override
  void initState() {
    super.initState();
    getPrefLogin();
  }

  @override
  Widget build(BuildContext context) {
    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: new Image.asset('assets/images/img_ask_bpjs.PNG'),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome to BPJSku',
        style: TextStyle(fontSize: 28.0, color: Colors.black),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Ini Halaman Awal BPJSKU',
        style: TextStyle(fontSize: 16.0, color: Colors.black),
      ),
    );

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/icons/icon_account.png'),
      ),
    );

    final username = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Username : '+temp,
        style: TextStyle(fontSize: 16.0, color: Colors.black),
      ),
    );

    final logoutButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 50,
            width: 300,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () {
                dialogPop();
              },
              child: Text(
                "Logout",
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    List<Widget> listScreen = [
    Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      child: Column(
        children: <Widget>[alucard, welcome, lorem],
      ),
    ),
    ListBerita(),
    Center(
      child: Container(
        padding: EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[logo,username,logoutButton],
        ),
      ),
    ),
    ];

    return Scaffold(
      body: listScreen.elementAt(currentScreen),
      bottomNavigationBar:
      BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        currentIndex: this.currentScreen,
        selectedItemColor: Colors.amber,
        onTap: (int index) {
          setState(() {
            this.currentScreen = index;
          });
        },
      ),
    );
  }
}