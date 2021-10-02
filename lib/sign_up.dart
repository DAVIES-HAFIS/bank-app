
import 'package:banks_app/sign_in.dart';
import 'package:flutter/material.dart';

import 'helperfunctions/colors.dart';
import 'helperfunctions/route.dart';
import 'helperfunctions/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Registeration extends StatefulWidget {
  @override
  _RegisterationState createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _email = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  dynamic validate() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, RoutesUrl.verifyaccount);
    } else {
      return null;
    }
  }

  // User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Hello '+ (user == null?'Please log-in':'Good Day')),
      // ),
      backgroundColor: AppColors.White,
      body: GestureDetector(
        onTap: () => dismissKeyBoard(context),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  // child: Image.asset('assets/images/ellipsebottomcenter.png'),
                  child: produceImage('assets/images/ellipsebottomcenter.png',
                      getScreenWidth(context), getScreenHeight(context) / 2),
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: getScreenWidth(context) * 0.05736),
                    width: getScreenWidth(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addVerticalSpacing(getScreenHeight(context) * 0.03,),
                        // GestureDetector(
                        //   child: produceBackImage(),
                        //   onTap: () {
                        //     Navigator.of(context).pop();
                        //   },
                        // ),
                        // addVerticalSpacing(getScreenHeight(context) * 0.0315,),
                        Text(
                          'Create Account',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w700),
                        ),
                        addVerticalSpacing(getScreenHeight(context) * 0.01785,),
                        Text(
                          'Create an account today to be one of our \n expert Riders.',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        addVerticalSpacing(getScreenHeight(context) * 0.04464,),
                        Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: getScreenWidth(context) * 0.422,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text('First Name'),
                                      addVerticalSpacing(getScreenHeight(context) * 0.00892),
                                      NameTF(
                                        nameTEC: _firstname,
                                        obscure: false,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: getScreenWidth(context) * 0.422,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text('Last Name'),
                                      addVerticalSpacing(getScreenHeight(context) * 0.00892),
                                      NameTF(
                                          nameTEC: _lastname, obscure: false),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        addVerticalSpacing(getScreenHeight(context) * 0.0267,),
                        Text(
                          'Email',
                          style: TextStyle(
                            color: Color.fromRGBO(51, 51, 51, 0.8),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        addVerticalSpacing(getScreenHeight(context) * 0.0089,),
                        EmailTF(emailTEC: _email, obscure: false),
                        addVerticalSpacing(getScreenHeight(context) * 0.02678,),
                        Text(
                          'Phone Number',
                          style: TextStyle(
                            color: Color.fromRGBO(51, 51, 51, 0.8),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        addVerticalSpacing(getScreenHeight(context) * 0.008928,),
                        PhoneTextField(phoneNumberTEC: _phone, obscure: false),
                        addVerticalSpacing(getScreenHeight(context) * 0.0267,),
                        Text(
                          'Password',
                          style: TextStyle(
                            color: Color.fromRGBO(51, 51, 51, 0.8),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        addVerticalSpacing(getScreenHeight(context) * 0.008928,),
                        PasswordTextField(
                          passwordTEC: _password,
                        ),
                        addVerticalSpacing(getScreenHeight(context) * 0.0267,),
                        Text(
                          'Confirm Password',
                          style: TextStyle(
                            color: Color.fromRGBO(51, 51, 51, 0.8),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        addVerticalSpacing(getScreenHeight(context) * 0.008928,),
                        ConfirmPasswordFormField(
                          confirmPassword: _confirmPassword,
                          password: _password,
                        ),
                        addVerticalSpacing(50),
                        GestureDetector(
                          child: AppButton(
                            buttonColor: AppColors.lightDeepGreen,
                            buttonContent: 'Create Account',
                          ),
                          onTap: () async  {
                            await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.text, password: _password.text);

                            LocalWidgets.showSnackbar(
                                context, "Registration Successful");
                            Future.delayed(
                                Duration(seconds: 2),
                                    () => Navigator.pushNamed(
                                    context, RoutesUrl.loginscreen));
                          },
                        ),
                        addVerticalSpacing(30),
                        GestureDetector(
                          child: Center(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Already a member?',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: ' Login',
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
                                    builder: (context) => LoginScreen()));
                          },
                        ),
                        addVerticalSpacing(100)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
