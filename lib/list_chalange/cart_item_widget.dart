
import 'package:flutter/material.dart';
import 'package:ui_challenges/list_chalange/task.dart';
class CardItemWidget extends StatefulWidget {
  final int index;
  final Task task;

  const CardItemWidget({super.key, required this.index, required this.task});

  @override
  State<CardItemWidget> createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      child: ListTile(
        leading: ReorderableDragStartListener(
          index: widget.index,
          child: const Icon(Icons.menu),
        ),
        title: Text(
          widget.task.title,
          style: TextStyle(
            fontSize: 13,
            decoration: widget.task.isDone
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        trailing: Checkbox(
          value: widget.task.isDone,
          onChanged: (v) {
            setState(() {
              widget.task.isDone = v!;
            });
          },
        ),
      ),
    );
  }
}
