import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vote_app/component/component.dart';

class SplashScreen extends StatefulWidget {
  final Widget firstScreen ;
  const SplashScreen({super.key , required this.firstScreen});
  @override
  State<SplashScreen> createState() => _SplashScreenState(firstScreen);
}



class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  final Widget first ;
  _SplashScreenState(this.first);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 3) , (){
      NavegatAndFinish(context, Directionality(textDirection: TextDirection.rtl, child: first));
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual , overlays: SystemUiOverlay.values);
    super.dispose();

  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(child: Text("V" , style: TextStyle(fontSize: 150 , fontWeight: FontWeight.bold , color: Colors.white),),),
    );
  }
}
