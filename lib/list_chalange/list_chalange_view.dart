import 'package:flutter/material.dart';
import 'package:ui_challenges/list_chalange/cart_item_widget.dart';
import 'package:ui_challenges/list_chalange/delete_dialog.dart';
import 'package:ui_challenges/list_chalange/task.dart';

class ListChalangeView extends StatefulWidget {
  const ListChalangeView({super.key});

  @override
  State<ListChalangeView> createState() => _ListChalangeViewState();
}

class _ListChalangeViewState extends State<ListChalangeView> {
  List<Task> items = [
    Task(title: 'Review Clean Architecture'),
    Task(title: 'Complete Flutter assignment'),
    Task(title: 'Practice widget catalog'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Challenge')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ReorderableListView(
          children: List.generate(
            items.length,
            (index) => Dismissible(
              key: ValueKey(items[index]),
              direction: DismissDirection.endToStart,
              confirmDismiss: (direction) async {
                return await delete_dialog(context);
              },
              background: Container(color: Colors.red),
              onDismissed: (direction) {
                final removedItem = items[index];
                final removedIndex = index;

                setState(() {
                  items.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Task Deleted'),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              items.insert(removedIndex, removedItem);
                            });
                          },
                          child: const Text(
                            'Undo',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },

              child: CardItemWidget(
                key: ValueKey(items[index].title),
                index: index,
                task: items[index],
              ),
            ),
          ),
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final item = items.removeAt(oldIndex);
              items.insert(newIndex, item);
            });
          },
        ),
      ),
    );
  }
}
