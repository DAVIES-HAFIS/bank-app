
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'colors.dart';


class LocalWidgets {
  LocalWidgets._();

  //functions
  static void showSnackbar(BuildContext context, String title) {
    final snackBar = SnackBar(content: Text(title));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showToast(
      {required String msg,
        Color bgColor = Colors.black,
        bool isLongLength = false}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: isLongLength ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3, // secs
        backgroundColor: bgColor,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  static PreferredSizeWidget produceAppBar(String title) {
    return AppBar(
      title: Text(title),
    );
  }

  static Widget emptyResponseContainer(BuildContext context, String title) {
    return Center(
      child: Container(
        width: 250,
        height: 100,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
              title,
              style: TextStyles.appColorNormalStyle,
              textAlign: TextAlign.center,
            )),
      ),
    );
  }

  static Widget produceEndDismissableBgContainer(
      {required String title,
        required Color bgColor,
        required IconData iconData}) {
    return Container(
      color: bgColor,
      padding: EdgeInsets.only(right: 16),
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              iconData,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  //non - functions
  static Widget showAppLoader = Center(
    child: CircularProgressIndicator(
      color: Colors.amber,
      backgroundColor: Colors.pink,
    ),
  );
}

class AppButton extends StatelessWidget {
  AppButton(
      {this.buttonColor,
        required this.buttonContent,
        this.contentColor,
        this.contentSize});
  final String buttonContent;
  final Color? buttonColor;
  final Color? contentColor;
  final double? contentSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: getScreenWidth(context) * 0.8816,
      height: getScreenHeight(context) * 0.06026,
      decoration: BoxDecoration(
        color: this.buttonColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        this.buttonContent,
        style: TextStyle(
            fontSize: this.contentSize,
            color: this.contentColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  PasswordTextField({
    required this.passwordTEC,
  });

  TextEditingController passwordTEC;
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      controller: widget.passwordTEC,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: getScreenWidth(context) * 0.04468,
            vertical: getScreenHeight(context) * 0.0212),
        suffixIcon: InkWell(
          onTap: _passwordVisibilty,
          child: obscureText
              ? Icon(
            Icons.visibility_off,
            color: AppColors.lightGreen,
          )
              : Icon(
            Icons.visibility,
            color: AppColors.lightGreen,
          ),
        ),
        focusColor: AppColors.lightGreen,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.deepGreen)),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.length < 4) {
          return 'password should be a minimum of 4 characters';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
    );
  }

  void _passwordVisibilty() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}

// ignore: must_be_immutable
class ForgotPassword extends StatelessWidget {
  ForgotPassword({required this.textColor});

  Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Forgot Password?',
          style: TextStyle(color: this.textColor),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class ConfirmPasswordFormField extends StatefulWidget {
  ConfirmPasswordFormField({
    Key? key,
    required TextEditingController confirmPassword,
    required TextEditingController password,
  })  : _confirmPassword = confirmPassword,
        _password = password,
        super(key: key);

  final TextEditingController _confirmPassword;
  final TextEditingController _password;

  @override
  _ConfirmPasswordFormFieldState createState() =>
      _ConfirmPasswordFormFieldState();
}

class _ConfirmPasswordFormFieldState extends State<ConfirmPasswordFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      controller: widget._confirmPassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: getScreenWidth(context) * 0.04468,
            vertical: getScreenHeight(context) * 0.0212),
        suffixIcon: InkWell(
          onTap: _passwordVisibilty,
          child: obscureText
              ? Icon(
            Icons.visibility_off,
            color: AppColors.lightGreen,
          )
              : Icon(
            Icons.visibility,
            color: AppColors.lightGreen,
          ),
        ),
        focusColor: AppColors.lightGreen,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.deepGreen)),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value != widget._password.value.text) {
          return 'Password does not match';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
    );
  }

  void _passwordVisibilty() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}

class NameTF extends StatefulWidget {
  NameTF({
    required this.nameTEC,
    required this.obscure,
  });

  final TextEditingController nameTEC;
  final bool obscure;
  @override
  _NameTFState createState() => _NameTFState();
}

class _NameTFState extends State<NameTF> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.obscure,
      controller: widget.nameTEC,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: getScreenWidth(context) * 0.04468,
            vertical: getScreenHeight(context) * 0.0212),
        focusColor: AppColors.lightGreen,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.deepGreen)),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.length < 3) {
          return 'minimum of 3 characters';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
    );
  }
}

class EmailTF extends StatefulWidget {
  EmailTF({
    required this.emailTEC,
    required this.obscure,
  });

  final TextEditingController emailTEC;
  final bool obscure;
  @override
  _EmailTFState createState() => _EmailTFState();
}

class _EmailTFState extends State<EmailTF> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.obscure,
      controller: widget.emailTEC,
      decoration: InputDecoration(
        hintText: 'tejnik2007@yahoo.co.uk',
        contentPadding: EdgeInsets.symmetric(
            horizontal: getScreenWidth(context) * 0.04468,
            vertical: getScreenHeight(context) * 0.0212),
        focusColor: AppColors.lightGreen,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.deepGreen)),
        border: OutlineInputBorder(),
      ),
      validator: EmailValidator(errorText: 'invalid email address'),
      textInputAction: TextInputAction.next,
    );
  }
}


// ignore: must_be_immutable
class PhoneTextField extends StatefulWidget {
  PhoneTextField({
    required this.phoneNumberTEC,
    required this.obscure,
    // this.globalKey,
  });

  TextEditingController phoneNumberTEC;
  bool obscure;
  // Key globalKey;

  @override
  _PhoneTextFieldState createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // key: widget.globalKey,
      obscureText: widget.obscure,
      keyboardType: TextInputType.phone,
      controller: this.widget.phoneNumberTEC,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: getScreenWidth(context) * 0.04468,
            vertical: getScreenHeight(context) * 0.0212),
        focusColor: AppColors.lightGreen,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.deepGreen)),
        border: OutlineInputBorder(),
        // labelText: 'Phone Number',
        hintText: '08077564532',
        fillColor: Color(0xffF7FCFC),
      ),
      validator: (value) {
        if (value!.length == 11) {
          return null;
        }
        return 'phone number should be 11 caharacters';
      },
      maxLength: 11,
      textInputAction: TextInputAction.next,
    );
  }
}

class TextStyles {
  TextStyles._();

  static const TextStyle appColorBoldStyle =
  TextStyle(color: Colors.amber, fontSize: 14, fontWeight: FontWeight.bold);

  static const TextStyle appColorNormalStyle = TextStyle(
      color: AppColors.lightGreen, fontSize: 14, fontWeight: FontWeight.normal);

  static const TextStyle appSecondaryTextStyle = TextStyle(
      color: AppColors.lightGreen, fontSize: 14, fontWeight: FontWeight.normal);

  static const TextStyle headlineOne =
  TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700);

  static const TextStyle largeText =
  TextStyle(color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold);

  static const TextStyle sliderDescription = TextStyle(
      height: 1.5,
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic);

  static const TextStyle subtitle = TextStyle(
      color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal);

  static const TextStyle defaulButtonText = TextStyle(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.normal);
}


double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

Widget addSeperator(Color color, double height) {
  return Divider(color: color, height: height);
}

Widget addVerticalSpacing(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalSpacing(double width) {
  return SizedBox(width: width);
}

double buttonHeight = 50;

Widget produceButton(
    String text, Color color, double width, VoidCallback onPressed,
    [Color textColor = Colors.white, double fontSize = 14]) {
  return Container(
    width: width,
    height: buttonHeight,
    child: ElevatedButton(
        child: Text(text,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.normal)),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color,
        )),
  );
}

Widget produceImage(String imgPath, double imgWidth, double imgHeight,
    [BoxFit fit = BoxFit.contain]) {
  return Image.asset(
    imgPath,
    fit: fit,
    width: imgWidth,
    height: imgHeight,
  );
}

Widget produceBackImage() {
  return Image.asset(
    'assets/images/back.png',
    width: 30,
    height: 30,
    color: Colors.black,
  );
}

Widget backButton(Color buttonColor, String image) {
  return GestureDetector(
    child: Container(
      alignment: Alignment.center,
      width: 58,
      height: 52,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Image.asset(
        image,
        width: 8.27,
        height: 13.64,
      ),
    ),
  );
}

void dismissKeyBoard(BuildContext context) {
  FocusScope.of(context).requestFocus(new FocusNode());
}

var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: true,
    isOverlayTapDismiss: true,
    descStyle: TextStyle(
      fontWeight: FontWeight.normal,
      color: Color.fromRGBO(51, 51, 51, 0.7),
      fontSize: 12,
    ),
    animationDuration: Duration(milliseconds: 300),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
        fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black),
    constraints: BoxConstraints.expand(width: 300),
    overlayColor: Color(0x55000000),
    alertElevation: 0,
    alertAlignment: Alignment.center);

void successAlert(
    BuildContext context, String title, String msg, Function nextAction) {
  Alert(
    context: context,
    title: title,
    style: alertStyle,
    desc: msg,
    image: Image.asset("assets/images/success.png"),
    buttons: [
      DialogButton(
        child: Text(
          "Okay",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        onPressed: () {
          Navigator.pop(context);
          nextAction();
        },
        color: AppColors.lightDeepGreen,
        radius: BorderRadius.circular(12.0),
      ),
    ],
  ).show();
}

void errorAlert(BuildContext context, String title, String msg) {
  Alert(
    context: context,
    title: title,
    desc: msg,
    style: alertStyle,
    image: Image.asset("assets/images/failure.png"),
    buttons: [
      DialogButton(
        child: Text(
          "Cancel",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        onPressed: () => Navigator.pop(context),
        color: AppColors.Red,
        radius: BorderRadius.circular(12.0),
      ),
    ],
  ).show();
}

