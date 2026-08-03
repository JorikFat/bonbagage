import 'package:flutter/material.dart';

class HelpersTextField {
  static BorderRadius border = BorderRadius.all(Radius.circular(12));
  static BorderSide borderSide = BorderSide(width: 3, color: Colors.black26);

  static final styleTextField = OutlineInputBorder(
      borderRadius: border,
      borderSide: borderSide,
  );

  static List<Map<String, dynamic>> dataTextField({
    TextEditingController? controllerTitle,
    TextEditingController? controllerEndDate,
    TextEditingController? controllerStartDate
  }) {
    final List<Map<String, dynamic>> data = [
      {"hintText": "City", "controller": controllerTitle},
      {"hintText": "start date", "controller": controllerEndDate},
      {"hintText": "end date", "controller": controllerStartDate},
    ];
    return data;
  }
}

class HelpersElevatedButton {
  static final elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.black12,
    shape: RoundedRectangleBorder(borderRadius: HelpersTextField.border),
  );
}