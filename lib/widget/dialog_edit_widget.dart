import 'package:bonbagage/bloc/journeys_cubit.dart';
import 'package:bonbagage/bloc/journeys_state.dart';
import 'package:bonbagage/utils/helpers.dart';
import 'package:flutter/material.dart';

void showDialogEdit(
  BuildContext context,
  JourneysCubit cubit,
  JourneysState journey,
) {
  showDialog(
    context: context,
    builder: (editDialogContext) {
      return JourneyEditDialog(cubit: cubit, journey: journey);
    },
  );
}

class JourneyEditDialog extends StatelessWidget {
  const JourneyEditDialog({
    super.key,
    required this.cubit,
    required this.journey,
  });

  final JourneysCubit cubit;
  final JourneysState journey;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerCityEdit = TextEditingController(
      text: journey.title,
    );
    final TextEditingController controllerStartDateEdit = TextEditingController(
      text: journey.startDate,
    );
    final TextEditingController controllerEndDateEdit = TextEditingController(
      text: journey.endDate,
    );

    final fields = HelpersTextField.dataTextField(
      controllerTitle: controllerCityEdit,
      controllerEndDate: controllerStartDateEdit,
      controllerStartDate: controllerEndDateEdit,
    );

    return AlertDialog(
      actions: <Widget>[
        Row(
          children: [
            ElevatedButton(
              style: HelpersElevatedButton.elevatedButtonStyle,
              onPressed: () {
                cubit.deleteJourneys(journey.id);
                Navigator.pop(context);
              },
              child: Text(
                "Удалить",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            SizedBox(width: 10),
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
            SizedBox(width: 10),
            ElevatedButton(
              style: HelpersElevatedButton.elevatedButtonStyle,
              onPressed: () {
                cubit.updateJourneys(
                  controllerCityEdit.text,
                  controllerStartDateEdit.text,
                  controllerEndDateEdit.text,
                  journey.id,
                );
                Navigator.pop(context);
              },
              child: Text(
                "Сохранить",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
          ],
        ),
      ],
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: fields.map((element) {
          return Padding(
            padding: EdgeInsets.only(top: 5),
            child: TextField(
              controller: element['controller'],
              decoration: InputDecoration(
                focusedBorder: HelpersTextField.styleTextField,
                enabledBorder: HelpersTextField.styleTextField,
                hintText: element['hintText'],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
