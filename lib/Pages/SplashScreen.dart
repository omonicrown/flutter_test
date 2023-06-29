import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // Color mainColor = Color(0xffb74093);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF4B3A),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(bottom: 20, left: 30, top: 70),
            child: Text(
              'Food for\n Everyone',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 55,
                  fontWeight: FontWeight.bold,fontFamily: 'Caprasimo'),
            ),
          ),
          Center(child: Image.asset('Images/splash.png', height: 300)),
          SizedBox(
            height: 50,
          ),
          InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, "homePage");
              },
              child: Ink(
                child: Text(
                  "Get Started",
                  style: TextStyle(
                      color: Colors.deepOrange, fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
              )),
        ],
      ),
    );
  }
}
