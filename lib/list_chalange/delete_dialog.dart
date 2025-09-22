import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Future<bool?> delete_dialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Delete'),
      content: const Text('Are you sure you want to delete?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, true); 
          },
          child: const Text('Delete'),
        ),
      ],
    ),
  );
}
