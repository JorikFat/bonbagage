import 'package:flutter/material.dart';
import 'package:bonbagage/view/journeys_view.dart';
import 'package:bonbagage/view/bags_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  String? selectedJourney; 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Navigator(
        pages: [
          MaterialPage(
            key: const ValueKey('JourneysPage'),
            child: JourneysView(
             
              onTap: (title) => setState(() => selectedJourney = title),
            ),
          ),
          if (selectedJourney != null)
            const MaterialPage(
              key: ValueKey('BagsPage'),
              child: BagsView(),
            ),
        ],
        
      ),
    );
  }
}