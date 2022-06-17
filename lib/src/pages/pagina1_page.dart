import 'package:animate_do/animate_do.dart';
import 'package:animate_do_app/src/pages/navegacion_page.dart';
import 'package:animate_do_app/src/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(
          duration: Duration(milliseconds: 500),
          child: Text('Animate do')
        ),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.twitter),
            onPressed: () { 
              Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => TwitterPage()));
             },
          ),
          SlideInLeft(
            from: 20,
            child: IconButton(
              icon: FaIcon(FontAwesomeIcons.arrowCircleRight),
              onPressed: () { 
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => Pagina1Page()));
               },
            ),
          ),
        ]
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: Duration(milliseconds: 1100),
              child: Icon(Icons.new_releases, color: Colors.blue, size:40)
            ),
            FadeInDown(
              delay: Duration(milliseconds: 200),
              child: Text('Titulo', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200))
            ),
            FadeInDown(
              delay: Duration(milliseconds: 1800),
              child: Text('Texto pequeño', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1500),
              child: Container(
                width: 220,
                height: 2,
                color:Colors.blue
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () { 
            Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => NavegacionPage()));
           },
          child: FaIcon(FontAwesomeIcons.play),
        ),
      ),
    );
  }
}