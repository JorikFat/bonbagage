import 'package:bonbagage/bloc/bags_cubit.dart';
import 'package:flutter/material.dart';

void showDialogEditThing(BuildContext context, String thingName, BagsCubit cubit, int id) {
  showDialog(
    context: context,
    builder: (context) {
      return DialogEditThingWidget(thingName: thingName, cubit: cubit, id: id);
    },
  );
}

class DialogEditThingWidget extends StatelessWidget {
  const DialogEditThingWidget({super.key, required this.thingName, required this.cubit, required this.id});

  final String thingName;
  final int id;
  final BagsCubit cubit;

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerThing = TextEditingController(text: thingName);

    final BorderRadius border = BorderRadius.all(Radius.circular(12));
    final BorderSide borderSide = BorderSide(width: 3, color: Colors.black26);

    final enableAndFocusedTextField = OutlineInputBorder(
      borderRadius: border,
      borderSide: borderSide,
    );

    final TextStyle textStyleHintText = TextStyle(
      fontSize: 16,
      color: Colors.black54,
    );

    final elevatedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: border),
      padding: EdgeInsets.only(left: 10, right: 10),
    );

    return AlertDialog(
      content: TextField(
        controller: _controllerThing,
        decoration: InputDecoration(
          hintText: "Thing...",
          enabledBorder: enableAndFocusedTextField,
          focusedBorder: enableAndFocusedTextField,
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: elevatedButtonStyle,
              onPressed: () => Navigator.pop(context),
              child: Text("Отмена", style: textStyleHintText),
            ),
            ElevatedButton(
              style: elevatedButtonStyle,
              onPressed: () {
                cubit.editThing(
                  _controllerThing.text,
                  id,
                );
                Navigator.pop(context);
              },
              child: Text("Сохранить", style: textStyleHintText),
            ),
          ],
        ),
      ],
    );
  }
}
