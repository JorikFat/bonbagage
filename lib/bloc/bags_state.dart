import 'package:bonbagage/model/things_model.dart';

class BagsState {
  final int id;
  final String title;
  final List<Thing> things;
  final bool isSelect;

  BagsState({
    required this.id,
    required this.title,
    required this.things,
    this.isSelect = false
  });

  BagsState copyWith({
    int? id,
    String? title,
    List<Thing>? things,
    bool? isSelect
  }) {
    return BagsState(
      id: id ?? this.id,
      title: title ?? this.title,
      things: things ?? this.things,
      isSelect: isSelect ?? this.isSelect
    );
  }
}