import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center ,
      children: [
        Image.network(
            width : MediaQuery.of(context).size.width,
            height: 300,
            "https://res.cloudinary.com/djf1vxr0k/image/upload/v1752416624/UnSad_logo_qzzemz.png"),
        SizedBox(height : 20,),
        Text("UnSad App" , style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold ),)
         ],
        ))
      ,);
  }
}
