import 'package:flutter/material.dart';
import 'index_page.dart';

class StartAnimationPage extends StatefulWidget {
  @override
  _StartAnimationPageState createState() => _StartAnimationPageState();
}

class _StartAnimationPageState extends State<StartAnimationPage> with SingleTickerProviderStateMixin{
   AnimationController _animationController;
   Animation _animation;

  @override
  void initState() { 
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    _animation = Tween(begin: 0.0,end: 1.0).animate(_animationController);
    _animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder: (context)=> IndexPage(),
        ),(route)=> route==null);
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() { 
    _animationController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FadeTransition(
        opacity: _animation,
        child: Image.asset('lib/images/aaaaaa.jpg',
        scale: 2.0,fit: BoxFit.cover,),
      ),
    );
  }
}