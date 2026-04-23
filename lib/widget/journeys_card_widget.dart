import 'package:flutter/material.dart';

class CardJourneys extends StatelessWidget {
  const CardJourneys({super.key, this.title, this.startDate, this.endDate, this.onTap});

  final title;
  final startDate;
  final endDate;
  final void Function(String)? onTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isTable = width >= 600;
    return GestureDetector(
      onTap: () {
        if (title != null && onTap != null) {
          onTap!(title!);
        }
      },
      child: Card(
        color: Color(0xFFf2f2f2),
        child: SizedBox(
          height: isTable ? width * 0.1 : width * 0.2,
          child: Row(
            children: [
              SizedBox(width: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title ?? '',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "${startDate ?? ''} - ${endDate ?? ''}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}