import 'package:flutter/material.dart';
import 'package:flutter_yoga/Screens/CustomAppBar.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation _colorTween,_homeTween,_yogaTween,_iconTween,_drawerTween;
  late AnimationController _textAnimationController;



  @override
  void initState() {
    _animationController = AnimationController(vsync: this , duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent , end: Colors.white).animate(_animationController);
    _iconTween = ColorTween(begin: Colors.white , end: Colors.lightBlue).animate(_animationController);
    _drawerTween = ColorTween(begin: Colors.white , end: Colors.black).animate(_animationController);
    _homeTween = ColorTween(begin: Colors.white , end: Colors.blue).animate(_animationController);
    _yogaTween = ColorTween(begin: Colors.white , end: Colors.black).animate(_animationController);
    _textAnimationController = AnimationController(vsync: this , duration: Duration(seconds: 0));
    super.initState();
  }



  bool scrollListner(ScrollNotification scrollNotification){
    bool scroll = false;
    if(scrollNotification.metrics.axis == Axis.vertical){
      _animationController.animateTo(scrollNotification.metrics.pixels/80);
      _textAnimationController.animateTo(scrollNotification.metrics.pixels);
      return scroll = true;
    }
    return scroll;
  }
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(),
      backgroundColor: Colors.white,
      body: NotificationListener(
        onNotification: scrollListner,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(height: 1000, color: Colors.blue,),
                            Container(height: 1000, color: Colors.green,),
                            Container(height: 1000, color: Colors.blue,)
                          ],
                        )
                      ],
                    ),
                  ),
                  CustomAppBar(animationController: _animationController, colorsTween: _colorTween, drawerTween: _drawerTween, homeTween: _homeTween, iconTween: _iconTween, onPressed: (){scaffoldKey.currentState?.openDrawer();}, yogaTween: _yogaTween)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
