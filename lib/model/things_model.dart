class Thing {
  final int id;
  final String name;

  Thing({required this.id, required this.name});

  Thing copyWith({
    int? id,
    String? name
  }) {
    return Thing(
      id: id ?? this.id,
      name: name ?? this.name
    );
  }
}