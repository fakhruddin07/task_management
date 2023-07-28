import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorDark = Color.fromRGBO(136, 28, 32, 1);
const colorGreen = Color.fromRGBO(33, 191, 115, 1);
const colorBlue = Color.fromRGBO(52, 152, 219, 1.0);
const colorOrange = Color.fromRGBO(230, 126, 34, 1.0);
const colorWhite = Color.fromRGBO(255, 255, 255, 1.0);
const colorDarkBlue = Color.fromRGBO(44, 62, 80, 1.0);
const colorLightGray = Color.fromRGBO(135, 142, 150, 1.0);
const colorLight = Color.fromRGBO(211, 211, 211, 1.0);

SizedBox itemSizedBox(child){
  return SizedBox(
    width: double.infinity,
    child: Container(
      padding: const EdgeInsets.all(10),
      child: child,
    ),
  );
}

PinTheme appOtpStyle(){
  return PinTheme(
    inactiveColor: colorLight,
    inactiveFillColor: colorWhite,
    selectedColor: colorGreen,
    selectedFillColor: colorGreen,
    activeColor: colorWhite,
    activeFillColor: colorWhite,
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(5),
    fieldHeight: 50,
    fieldWidth: 50,
    borderWidth: 0.5
  );
}

TextStyle head1Text(textColor) {
  return TextStyle(
    color: textColor,
    fontSize: 28,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w700,
  );
}

TextStyle head6Text(textColor) {
  return TextStyle(
    color: textColor,
    fontSize: 16,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w400,
  );
}

TextStyle head7Text(textColor) {
  return TextStyle(
    color: textColor,
    fontSize: 13,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w400,
  );
}

TextStyle head9Text(textColor) {
  return TextStyle(
    color: textColor,
    fontSize: 10,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w400,
  );
}

InputDecoration appInputDecoration(label) {
  return InputDecoration(
    fillColor: colorWhite,
    filled: true,
    labelText: label,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
    border: const OutlineInputBorder(),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: colorGreen,
        width: 2,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: colorWhite,
        width: 0.0,
      ),
    ),
  );
}

/*DecoratedBox is using for DropDown Menu*/
DecoratedBox appDropDownStyle(child) {
  return DecoratedBox(
    decoration: BoxDecoration(
      color: colorWhite,
      border: Border.all(
        color: colorWhite,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: child,
    ),
  );
}

SvgPicture screenBackground(context) {
  return SvgPicture.asset(
    "assets/images/background.svg",
    alignment: Alignment.center,
    height: MediaQuery.sizeOf(context).height,
    width: MediaQuery.sizeOf(context).width,
    fit: BoxFit.cover,
  );
}

ButtonStyle appButtonStyle() {
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.zero,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    ),
  );
}

TextStyle buttonTextStyle() {
  return const TextStyle(
    fontSize: 14,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w400,
  );
}

Ink successButtonChild(buttonText) {
  return Ink(
    decoration: BoxDecoration(
      color: colorGreen,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(
        buttonText,
        style: buttonTextStyle(),
      ),
    ),
  );
}

void successToast(msg) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: colorGreen,
    timeInSecForIosWeb: 1,
    textColor: colorWhite,
    fontSize: 16,
  );
}

void errorToast(msg) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: colorRed,
    timeInSecForIosWeb: 1,
    textColor: colorWhite,
    fontSize: 16,
  );
}