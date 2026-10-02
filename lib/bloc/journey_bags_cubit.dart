import 'package:bonbagage/bloc/bags_state.dart';
import 'package:bonbagage/model/things_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JourneyBagsCubit extends Cubit<List<BagsState>> {
  JourneyBagsCubit()
    : super([
        BagsState(
          id: 0,
          title: "Чемодан",
          things: [
            Thing(id: 0, name: "Рубашка", isSelect: true),
            Thing(id: 1, name: "Брюки", isSelect: false),
            Thing(id: 2, name: "Футболка", isSelect: true),
          ],
        ),
        BagsState(
          id: 1,
          title: "Рюкзак",
          things: [
            Thing(id: 3, name: "Ноутбук", isSelect: false),
            Thing(id: 4, name: "Планшет", isSelect: true),
          ],
        ),
        BagsState(
          id: 2,
          title: "Пакет",
          things: [Thing(id: 5, name: "Кроссовки", isSelect: false)],
        ),
      ]);

  void checkBoxSwitch(int id) {
    final update = state.map((itemBag) {
      final thing = itemBag.things.map((item) {
        if (item.id == id) {
          return item.copyWith(isSelect: !item.isSelect);
        } else {
          return item;
        }
      }).toList();
      final allSelect = thing.every((select) => select.isSelect == true);
      return itemBag.copyWith(isSelect: allSelect, things: thing);
    }).toList();
    emit([...update]);
  }

  void allSelectCheckBox(int id) {
    final update = state.map((itemBag) {
      if (itemBag.id == id) {
        final allSelect = itemBag.things.every((select) => select.isSelect == true);
        final select = !allSelect;
        final thing = itemBag.things.map((item) {
          return item.copyWith(isSelect: select);
        }).toList();
        return itemBag.copyWith(isSelect: select, things: thing);
      } else {
        return itemBag;
      }
    }).toList();
    emit([...update]);
  }
}
