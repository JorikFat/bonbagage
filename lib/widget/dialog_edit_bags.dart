import 'package:bonbagage/bloc/bags_cubit.dart';
import 'package:bonbagage/utils/helpers.dart';
import 'package:flutter/material.dart';

void showEditBagsDialog({
  required BuildContext context,
  required String bagsName,
  required BagsCubit cubit,
  required int id
  }) {
    
  showDialog(
    context: context,
    builder: (bagsContext) {
      return DialogEditBags(bagsName: bagsName, id: id, cubit: cubit);
    },
  );
}

class DialogEditBags extends StatefulWidget {
  const DialogEditBags({
    super.key,
    required this.bagsName,
    required this.id,
    required this.cubit,
  });

  final String bagsName;
  final int id;
  final BagsCubit cubit;

  @override
  State<DialogEditBags> createState() => _DialogEditBagsState();
}

class _DialogEditBagsState extends State<DialogEditBags> {
  late final TextEditingController _controllerBags;

  @override
  void initState() {
    super.initState();
    _controllerBags = TextEditingController(text: widget.bagsName);
  }

  @override
  void dispose() {
    _controllerBags.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controllerBags,
            decoration: InputDecoration(
              focusedBorder: HelpersTextField.styleTextField,
              enabledBorder: HelpersTextField.styleTextField,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        Row(
          children: [
            ElevatedButton(
              style: HelpersElevatedButton.elevatedButtonStyle,
              onPressed: () {
                widget.cubit.deleteBags(widget.id);
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
                widget.cubit.updateBags(
                  _controllerBags.text,
                  widget.id
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
    );
  }
}
