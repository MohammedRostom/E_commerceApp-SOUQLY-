import 'package:flutter/material.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/utils/colors.dart';

TextFormField CustemTextfield({
  required SavedValue,
  required Label,
  required messagevalidator,
  required controller,
  required Widget suffixIcon,
  @required obscureText,
}) {
  return TextFormField(
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$messagevalidator';
        }
      },
      onSaved: (newValue) {
        newValue = SavedValue;
      },
      style: TextStyle(
        color: Colors.white.withOpacity(0.5), // Set the text color to blue
      ),
      controller: controller,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.black45),
        suffixIcon: suffixIcon,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color:
                  Colors_App.NotActiveIconColor), // No border, just underline
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Colors.blue), // No border, just underline
        ),
        labelText: '$Label',
        floatingLabelStyle: TextStyle(
          color: Colors_App.blueColorto,
          // Set the label color to blue
        ),
        labelStyle: TextStyle(
          color: Colors_App.NotActiveIconColor,
          // Set the label color to blue
        ),
      ));
}
