import 'package:bonbagage/bloc/bags_cubit.dart';
import 'package:bonbagage/utils/helpers.dart';
import 'package:flutter/material.dart';

void showDialogEditThing(
  BuildContext context,
  String thingName,
  BagsCubit cubit,
  int id,
) {
  showDialog(
    context: context,
    builder: (context) {
      return DialogEditThingWidget(thingName: thingName, cubit: cubit, id: id);
    },
  );
}

class DialogEditThingWidget extends StatefulWidget {
  const DialogEditThingWidget({
    super.key,
    required this.thingName,
    required this.cubit,
    required this.id,
  });

  final String thingName;
  final int id;
  final BagsCubit cubit;

  @override
  State<DialogEditThingWidget> createState() => _DialogEditThingWidgetState();
}

class _DialogEditThingWidgetState extends State<DialogEditThingWidget> {
  late final TextEditingController controllerThing;

  @override
  void initState() {
    super.initState();
    controllerThing = TextEditingController(text: widget.thingName);
  }

  @override
  void dispose() {
    controllerThing.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: controllerThing,
        decoration: InputDecoration(
          hintText: "Thing...",
          enabledBorder: HelpersTextField.styleTextField,
          focusedBorder: HelpersTextField.styleTextField,
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: HelpersElevatedButton.elevatedButtonStyle,
              onPressed: () => Navigator.pop(context),
              child: Text("Отмена", style: TextStyle(fontSize: 14, color: Colors.black54)),
            ),
            ElevatedButton(
              style: HelpersElevatedButton.elevatedButtonStyle,
              onPressed: () {
                widget.cubit.editThing(controllerThing.text, widget.id);
                Navigator.pop(context);
              },
              child: Text("Сохранить", style: TextStyle(fontSize: 14, color: Colors.black54)),
            ),
          ],
        ),
      ],
    );
  }
}
