import 'package:flutter/material.dart';
import 'package:ui_challenges/color_chalange/color_chalange_view.dart';
import 'package:ui_challenges/list_chalange/list_chalange_view.dart';
import 'package:ui_challenges/loading_chalange/loading_chalange_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ui Challenges'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListChalangeView()),
                );
              },
              child: Text(
                "Task Manager ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ColorChalangeView()),
                );
              },
              child: Text(
                "Color Chalange",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SequentialLoadingDots(),
                  ),
                );
              },
              child: Text(
                "Squential Loading Dots",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
