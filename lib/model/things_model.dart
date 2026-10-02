class Thing {
  final int id;
  final String name;
  final bool isSelect;
  Thing({required this.id, required this.name, this.isSelect = false});

  Thing copyWith({
    int? id,
    String? name,
    bool? isSelect
  }) {
    return Thing(
      id: id ?? this.id,
      name: name ?? this.name,
      isSelect: isSelect ?? this.isSelect
    );
  }
}