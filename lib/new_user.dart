import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  static String tag = 'user-page';

  @override
  Widget build(BuildContext context) {

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'New User',
        style: TextStyle(fontSize: 28.0, color: Colors.black),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Oopsi...  the page is not ready',
        style: TextStyle(fontSize: 16.0, color: Colors.black),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(28.0),
          children: <Widget>[
            welcome,
            lorem
          ],
        ),
      ),
    );
  }
}