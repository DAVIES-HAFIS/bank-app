import 'dart:async';
import 'package:banks_app/sign_in.dart';
import 'package:flutter/material.dart';

import 'helperfunctions/colors.dart';
import 'helperfunctions/route.dart';
import 'helperfunctions/widgets.dart';


class SplashScreen1 extends StatefulWidget {


  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(60),
        width: getScreenWidth(context),
        height: getScreenHeight(context),
        color: AppColors.deepGreen,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 300,),
              Text(
                'WELCOME ',
                style: TextStyle(color: AppColors.greyWhite,fontSize:20,fontWeight: FontWeight.w700),
              ),
             Text(
          'HAFIS DAVIES BANK......',
          style: TextStyle(color: AppColors.greyWhite,fontSize:20,fontWeight: FontWeight.w700),
           ),
           Spacer(),
           GestureDetector(
          child: Container(
            height: getScreenHeight(context) * 0.06026,
            width: getScreenWidth(context) * 0.8816,
            decoration: BoxDecoration(
                color: AppColors.White,
                borderRadius: BorderRadius.circular(8.0)),
            child: Center(
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: AppColors.deepGreen,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
          },
        ),
          ],
        )

          // getScreenWidth(context) * 0.437,
          // getScreenHeight(context) * 0.0725),
        ),
      ),
    );
  }
}

