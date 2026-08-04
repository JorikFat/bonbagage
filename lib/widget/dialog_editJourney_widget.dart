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

class DialogEditjourneyWidget extends StatefulWidget {
  const DialogEditjourneyWidget({super.key, required this.cubit});
  final BagsCubit cubit;

  @override
  State<DialogEditjourneyWidget> createState() => _DialogEditjourneyWidgetState();
}

class _DialogEditjourneyWidgetState extends State<DialogEditjourneyWidget> {
  late final TextEditingController controllerTitle;

  @override
  void initState() {
    super.initState();
    controllerTitle = TextEditingController();
  }

  @override
  void dispose() {
    controllerTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                widget.cubit.addBags(controllerTitle.text);
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
