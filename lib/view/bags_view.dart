import 'package:flutter/material.dart';
class BagsView extends StatelessWidget {
  const BagsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bags"),
      ),
      body: ListView(
        children: [
            const BagCard(title: "Чемодан"),
            const BagCard(title: "Рюкзак"),
            const BagCard(title: "Пакет"),
          ] 
      ));
}}

class BagCard extends StatelessWidget {
  final String title;

  const BagCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFf2f2f2),
      child: SizedBox(
        height: 100,
        width: 200,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}