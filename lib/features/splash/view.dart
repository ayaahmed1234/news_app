import 'package:flutter/material.dart';
import 'package:news/features/home/Nav_bar.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    timer();
  }
void timer ()async{
    await Future.delayed(Duration(seconds: 3),() {
      rroute();
    },);
}
void rroute(){
  Navigator.of(context).push( MaterialPageRoute(builder: (context) => NavBar(),));

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff001F3F) ,
      appBar: AppBar(
        backgroundColor: Color(0xff001F3F) ,
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/Group 24.png"),
        ],
      ),
    );
  }
}
