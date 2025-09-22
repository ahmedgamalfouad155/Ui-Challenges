import 'package:flutter/material.dart';

class ColorChalangeView extends StatefulWidget {
  const ColorChalangeView({super.key});

  @override
  State<ColorChalangeView> createState() => _ColorChalangeViewState();
}

class _ColorChalangeViewState extends State<ColorChalangeView> {
  final Map<Color, bool> matched = {
    Colors.red: false,
    Colors.blue: false,
    Colors.green: false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Physics Playground")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var color in [Colors.red, Colors.blue, Colors.green])
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: matched[color] == false
                      ? Draggable<Color>(
                          data: color,
                          feedback: CircleAvatar(
                            backgroundColor: color,
                            radius: 30,
                          ),
                          childWhenDragging: CircleAvatar(
                            backgroundColor: color.shade200,
                            radius: 30,
                          ),
                          child: CircleAvatar(
                            backgroundColor: color,
                            radius: 30,
                          ),
                        )
                      : CircleAvatar(backgroundColor: color, radius: 30),
                ),
            ],
          ),
          const SizedBox(height: 50),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var color in [Colors.red, Colors.blue, Colors.green])
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: DragTarget<Color>(
                    onWillAcceptWithDetails: (details) => true,
                    onAcceptWithDetails: (details) {
                      if (details.data == color) {
                        setState(() {
                          matched[color] = true;
                        });
                      }
                    },
                    builder: (context, candidateData, rejectedData) {
                      final isHovering = candidateData.isNotEmpty;

                      bool isCorrectHover = false;
                      bool isWrongHover = false;

                      if (isHovering) {
                        isCorrectHover = candidateData.first == color;
                        isWrongHover = candidateData.first != color;
                      }

                      return Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: matched[color] == true
                              ? color
                              : color.shade200,
                          border: Border.all(color: color, width: 3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: matched[color] == true
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 40,
                                )
                              : isCorrectHover
                              ? const Icon(Icons.check, color: Colors.white)
                              : isWrongHover
                              ? const Icon(
                                  Icons.arrow_downward_rounded,
                                  color: Colors.white,
                                  size: 20,
                                )
                              : null,
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
