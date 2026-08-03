import 'package:bonbagage/bloc/bags_cubit.dart';
import 'package:bonbagage/utils/helpers.dart';
import 'package:flutter/material.dart';

void showEditJourneyDialog(BuildContext context, BagsCubit cubit) {
  showDialog(
    context: context,
    builder: (dialogContext) {
      return DialogEditjourneyWidget(cubit: cubit);
    },
  );
}

class DialogEditjourneyWidget extends StatelessWidget {
  const DialogEditjourneyWidget({super.key, required this.cubit});
  final BagsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerTitle = TextEditingController();

    return AlertDialog(
      content: TextField(
        controller: controllerTitle,
        cursorColor: Colors.black26,
        decoration: InputDecoration(
          focusedBorder: HelpersTextField.styleTextField,
          enabledBorder: HelpersTextField.styleTextField,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: HelpersElevatedButton.elevatedButtonStyle,
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Отмена",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            ElevatedButton(
              style: HelpersElevatedButton.elevatedButtonStyle,
              onPressed: () {
                cubit.addBags(controllerTitle.text);
                controllerTitle.clear();
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
