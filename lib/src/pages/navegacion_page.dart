import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  const NavegacionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text('Notifications page')
        ),
        floatingActionButton: BotonFlotante(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final int numero = Provider.of<_NotificationModel>(context).numero;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.purpleAccent,
      items: [
        BottomNavigationBarItem(
          title: Text('Bone'),
          icon: FaIcon(FontAwesomeIcons.bone)
        ),
        BottomNavigationBarItem(
          title: Text('Notifications'),
          icon: Stack(
            children: [
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top:0,
                right: 0,
                child: BounceInDown(
                  from: 10,
                  animate: (numero>0) ? true : false,
                  child: Bounce(
                    from: 10,
                    controller: (controller) => Provider.of<_NotificationModel>(context).bounceController = controller,
                    animate: (numero>1) ? true : false,
                    child: Container(
                      width: 12,
                      height: 12,
                      child: Text(numero.toString(), style: TextStyle(color: Colors.white, fontSize: 7),),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle
                      ),
                    ),
                  ),
                )
                // Icon(Icons.brightness_1, color:Colors.red, size:12)
              )
            ],
          )
        ),
        BottomNavigationBarItem(
          title: Text('My Dog'),
          icon: FaIcon(FontAwesomeIcons.dog)
        ),
      ],
    );
  }
}

class BotonFlotante extends StatelessWidget {
  const BotonFlotante({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final _NotificationModel notificationModel = Provider.of<_NotificationModel>(context, listen: false);

        notificationModel.numero +=1;

        if (notificationModel.numero>1){
          notificationModel.bounceController.forward(from: 0.0) ;
        }
        
      },
      backgroundColor: Colors.purpleAccent,
      child: FaIcon(FontAwesomeIcons.play),
    );
  }
}


  class _NotificationModel extends ChangeNotifier{
    int _numero = 0;
    AnimationController _bounceController;

    int get numero => this._numero;

    set numero(int val){
      this._numero = val;
      notifyListeners();
    }

    AnimationController get bounceController => this._bounceController;

    set bounceController(AnimationController val){
      this._bounceController = val;
      notifyListeners();
    }
  }