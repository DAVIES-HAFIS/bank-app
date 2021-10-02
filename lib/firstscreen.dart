
import 'package:flutter/material.dart';

import 'helperfunctions/colors.dart';
import 'helperfunctions/route.dart';
import 'helperfunctions/widgets.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: getScreenHeight(context) * 1,
              width: getScreenWidth(context) * 1,
              decoration: BoxDecoration(
                color: Color(0xffC4C4C4),
                image: DecorationImage(
                  image: AssetImage('assets/images/fashion.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: getScreenHeight(context) * 0.4933),
              height: getScreenHeight(context) * 0.50669,
              width: getScreenWidth(context),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/overlay_onboarding.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  addVerticalSpacing(getScreenHeight(context) * 0.7304),
                  Text(
                    'WE GROW YOUR BUSINESS',
                    style: TextStyle(
                      color: AppColors.deepGreen,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  addVerticalSpacing(getScreenHeight(context) * 0.0089,),
                  Text(
                    'We are committed to the growth of our clients \n we would go on the journey with you.',
                    style: TextStyle(
                      color: AppColors.Grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  addVerticalSpacing(getScreenHeight(context) * 0.0089 * 2,
                  ),
                  Container(
                    width: getScreenWidth(context) * 0.0966,
                    height: getScreenHeight(context) * 0.0089,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: getScreenWidth(context) * 0.0193,
                          height: getScreenHeight(context) * 0.0089,
                          decoration: BoxDecoration(
                            color: AppColors.deepGreen,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                        Container(
                          width: getScreenWidth(context) * 0.0193,
                          height: getScreenHeight(context) * 0.0089,
                          decoration: BoxDecoration(
                            color: AppColors.White,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                        Container(
                          width: getScreenWidth(context) * 0.0193,
                          height: getScreenHeight(context) * 0.0089,
                          decoration: BoxDecoration(
                            color: AppColors.White,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  addVerticalSpacing(getScreenHeight(context) * 0.049107,
                  ),
                  GestureDetector(
                    child: Container(
                      height: getScreenHeight(context) * 0.06026,
                      width: getScreenWidth(context) * 0.8816,
                      decoration: BoxDecoration(
                          color: AppColors.White,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Center(
                        child: Text(
                          'Next',
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
                      Navigator.pushNamed(context, RoutesUrl.loginscreen);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
