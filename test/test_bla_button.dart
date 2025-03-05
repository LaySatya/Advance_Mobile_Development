import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/widgets/actions/bla_buttons.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              BlaButton(
                text: 'Contact Volodia', 
                icon: Icons.message_rounded,
                type: ButtonType.secondary,     
              ),
              BlaButton(
                text: 'Request to book', 
                icon: Icons.book,    
                type: ButtonType.primary,
              ),
            ],
          )
        )),
    );
  }
}
