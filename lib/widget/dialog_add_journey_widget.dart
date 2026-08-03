import 'package:bonbagage/bloc/journeys_cubit.dart';
import 'package:bonbagage/utils/helpers.dart';
import 'package:flutter/material.dart';

void showDialogAdd(BuildContext context, JourneysCubit cubit) {
  showDialog(
    context: context,
    builder: (dialogContext) {
      return JourneyDialogAdd(cubit: cubit);
    },
  );
}

class JourneyDialogAdd extends StatelessWidget {
  const JourneyDialogAdd({super.key, required this.cubit});
  final JourneysCubit cubit;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: HelpersTextField.dataTextField().map((element) {
          return Padding(
            padding: EdgeInsets.only(top: 5),
            child: TextField(
              controller: element['controller'],
              decoration: InputDecoration(
                focusedBorder: HelpersTextField.styleTextField,
                enabledBorder: HelpersTextField.styleTextField,
                hintText: element['hintText']
              ),
            ),
          );
        }).toList(),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: HelpersElevatedButton.elevatedButtonStyle,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Отмена",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            ElevatedButton(
              style: HelpersElevatedButton.elevatedButtonStyle,
              onPressed: () {
                cubit.addJourneys(
                  HelpersTextField.controllerCity.text,
                  HelpersTextField.controllerStartDate.text,
                  HelpersTextField.controllerEndDate.text,
                );
                HelpersTextField.controllerCity.clear();
                HelpersTextField.controllerStartDate.clear();
                HelpersTextField.controllerEndDate.clear();
                Navigator.pop(context);
              },
              child: Text(
                "Добавить",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
