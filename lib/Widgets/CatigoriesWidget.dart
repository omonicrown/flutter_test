import 'package:flutter/material.dart';
import 'package:food_test/Models/user_model.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override

  Widget build(BuildContext context) {


    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Foods',
              style: TextStyle(
                fontSize: 25,
                  decoration: TextDecoration.underline,
                // fontWeight: FontWeight.bold,
                color: Color(0xFFFF4B3A)
              ),
              ),
              Text('Drinks',
                style: TextStyle(
                    fontSize: 25,
                    // decoration: TextDecoration.underline,
                    // fontWeight: FontWeight.bold,
                    color: Colors.grey
                ),
              ),
              Text('Snacks',
                style: TextStyle(
                    fontSize: 25,
                    // decoration: TextDecoration.underline,
                    // fontWeight: FontWeight.bold,
                    color: Colors.grey
                ),
              ),
              Text("See All",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(bottom: 50),
          child: Row(
            children: [
              for(int i=1; i<8; i++)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                width: 200,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 6
                    )
                  ]
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.asset("Images/1.png",height: 150,width: 200,),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                        padding: EdgeInsets.only(right: 5),
                      child: Text("Vegie\n Tomato Mix",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
