import 'package:bonbagage/bloc/bags_state.dart';
import 'package:bonbagage/bloc/journey_bags_cubit.dart';
import 'package:flutter/material.dart';

class BagCardWidget extends StatelessWidget {
  const BagCardWidget({super.key, required this.bag, required this.cubit});

  final BagsState bag;
  final JourneyBagsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFf2f2f2),
      child: SizedBox(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  bag.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Column(
              children: bag.things.map((list) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text(list.name, style: TextStyle(fontSize: 16)),
                        Checkbox(
                          value: list.isSelect,
                          onChanged: (bool? value) {
                            cubit.checkBoxSwitch(list.id);
                          }
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
