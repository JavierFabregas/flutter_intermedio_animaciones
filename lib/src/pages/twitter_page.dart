import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  const TwitterPage({Key key}) : super(key: key);

  @override
  _TwitterPageState createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool activar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1da1f2),
      body: Center(
        child: ZoomOut(
          animate: activar,
          from: 30,
          duration: Duration(milliseconds: 1000),
          child: FaIcon(FontAwesomeIcons.twitter, color: Colors.white.withOpacity(0.7), size: 50 ,)
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent,
        child: FaIcon(FontAwesomeIcons.play),
        onPressed: () { 
          setState(() {
            activar = true;
          });
         },

      ),
    );
  }
}