import 'package:flutter/material.dart';
import 'package:bonbagage/widget/dialog_add_journey_widget.dart';
import 'package:bonbagage/widget/dialog_editJourney_widget.dart';

class HelpersTextField {
  /// [JourneyDialogAdd] TextEditingControllers
  static final TextEditingController controllerCity = TextEditingController();
  static final TextEditingController controllerEndDate = TextEditingController();
  static final TextEditingController controllerStartDate = TextEditingController();

  /// [DialogEditjourneyWidget] TextEditingControllers
  static final TextEditingController controllerTitle = TextEditingController();

  static BorderRadius border = BorderRadius.all(Radius.circular(12));
  static BorderSide borderSide = BorderSide(width: 3, color: Colors.black26);

  static final styleTextField = OutlineInputBorder(
      borderRadius: border,
      borderSide: borderSide,
  );

  static List dataTextField() {
    final List<Map<String, dynamic>> data = [
      {"hintText": "City", "controller": controllerCity},
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