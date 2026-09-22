import 'package:bonbagage/bloc/bags_cubit.dart';
import 'package:bonbagage/bloc/bags_state.dart';
import 'package:bonbagage/utils/helpers.dart';
import 'package:flutter/material.dart';

void showAddThingDialog(BuildContext context, BagsState bags, BagsCubit cubit) {
  showDialog(
    context: context,
    builder: (thingContext) {
      return DialogAddThingEditJourney(bags: bags, cubit: cubit);
    },
  );
}

class DialogAddThingEditJourney extends StatefulWidget {
  const DialogAddThingEditJourney({super.key, required this.bags, required this.cubit});

  final BagsState bags;
  final BagsCubit cubit;

  @override
  State<DialogAddThingEditJourney> createState() => _DialogAddThingEditJourneyState();
}

class _DialogAddThingEditJourneyState extends State<DialogAddThingEditJourney> {
  late final TextEditingController controllerThing;

  @override
  void initState() {
    super.initState();
    controllerThing = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Добавить в ${widget.bags.title}",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextField(
              controller: controllerThing,
              decoration: InputDecoration(
                hintText: "Thing...",
                focusedBorder: HelpersTextField.styleTextField,
                enabledBorder: HelpersTextField.styleTextField
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: HelpersElevatedButton.elevatedButtonStyle,
              onPressed: () => {
                Navigator.pop(context),
              },
              child: Text(
                "Отмена",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            ElevatedButton(
              style: HelpersElevatedButton.elevatedButtonStyle,
              onPressed: () {
                widget.cubit.addThingInList(
                  controllerThing.text,
                  widget.bags.id
                );
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
