import 'package:banks_app/firstscreen.dart';
import 'package:banks_app/sign_up.dart';
import 'package:flutter/material.dart';

import 'helperfunctions/colors.dart';
import 'helperfunctions/route.dart';
import 'helperfunctions/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validate(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FirstScreen()));
    } else {
      errorAlert(context, "OOPS",
          "Enter Login Credentials, your email and password is required!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => dismissKeyBoard(context),
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.appBackColor,
            width: getScreenWidth(context),
            height: getScreenHeight(context),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: getScreenWidth(context),
                    height: getScreenHeight(context) / 4,
                    decoration: BoxDecoration(
                      color: AppColors.LighterGreen,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addVerticalSpacing(100),
                        Center(
                          child: Text(
                            "WE ARE GLAD TO HAVE YOU HERE \n LET'S HELP YOU ON THIS JOURNEY",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16),
                          ),
                          // child: Image.asset(
                          //   'assets/images/kangaroo_green_icon.png',
                          //   width: getScreenWidth(context) - 100,
                          //   height: getScreenHeight(context) / 8,
                          // ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getScreenWidth(context) * 0.05736),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addVerticalSpacing(
                          getScreenHeight(context) * 0.04464,
                        ),
                        Text(
                          'Hello, Welcome Back.',
                          style: TextStyle(
                            color: Color(0xff181725),
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        addVerticalSpacing(
                          getScreenHeight(context) * 0.008928,
                        ),
                        Text(
                          'Kindly input your details to login into your \ndashboard.',
                          style: TextStyle(
                            color: Color.fromRGBO(51, 51, 51, 0.7),
                            fontSize: 15,
                          ),
                        ),
                        addVerticalSpacing(
                          getScreenHeight(context) * 0.04464,
                        ),
                        Text(
                          'E-mail address',
                          style: TextStyle(
                            color: Color.fromRGBO(51, 51, 51, 0.8),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        addVerticalSpacing(
                          getScreenHeight(context) * 0.008928,
                        ),
                        EmailTF(
                          obscure: false,
                          emailTEC: _email,
                        ),
                        addVerticalSpacing(
                          getScreenHeight(context) * 0.02678,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(
                            color: Color.fromRGBO(51, 51, 51, 0.8),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        addVerticalSpacing(getScreenHeight(context) * 0.008928),
                        PasswordTextField(
                          passwordTEC: _password,
                        ),
                        addVerticalSpacing(
                          getScreenHeight(context) * 0.017857,
                        ),
                        GestureDetector(
                          child: ForgotPassword(
                            textColor: AppColors.lightGreen,
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesUrl.resetpassword);
                          },
                        ),
                        addVerticalSpacing(
                          getScreenHeight(context) * 0.0625,
                        ),
                        GestureDetector(
                          child: AppButton(
                            buttonColor: AppColors.lightDeepGreen,
                            buttonContent: 'Login',
                          ),
                          onTap: () => validate(context),
                          // show  snackbar to validate..
                        ),
                        addVerticalSpacing(
                          getScreenHeight(context) * 0.017857,
                        ),
                        GestureDetector(
                          child: Center(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Don’t have an account yet?',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: ' Sign up',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.lightGreen),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Registeration()));
                          },
                        ),
                        addVerticalSpacing(
                          getScreenHeight(context) * 0.017857,
                        ),
                        GestureDetector(
                          child: AppButton(
                            buttonColor: AppColors.lightDeepGreen,
                            buttonContent: 'Log-out',
                          ),
                          onTap: () async {
                            await FirebaseAuth.instance.signOut();
                            setState(() {});
                          },
                          // show  snackbar to validate..
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
