class Journey {
  final String title;
  final String startDate;
  final String endDate;
  final int id;

  Journey({
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.id
  });

  Journey copyWith({
    String? title,
    String? startDate,
    String? endDate,
    int? id
  }) {
    return Journey(
      title: title ?? this.title,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.startDate,
      id: id ?? this.id
    );
  }
}