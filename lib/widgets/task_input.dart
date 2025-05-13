import 'package:flutter/material.dart';
import '../models/task_model.dart';

class TaskInput extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController categoryController;
  final int priority;
  final Function(int) onPriorityChanged;
  final Function onSave;

  const TaskInput({
    super.key,
    required this.titleController,
    required this.categoryController,
    required this.priority,
    required this.onPriorityChanged,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: titleController,
          decoration: const InputDecoration(
            labelText: 'Task Title',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: categoryController,
          decoration: const InputDecoration(
            labelText: 'Category',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<int>(
          value: priority,
          decoration: const InputDecoration(labelText: 'Priority'),
          items: const [
            DropdownMenuItem(value: 0, child: Text('Low')),
            DropdownMenuItem(value: 1, child: Text('Medium')),
            DropdownMenuItem(value: 2, child: Text('High')),
          ],
          onChanged: (value) {
            if (value != null) onPriorityChanged(value);
          },
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () => onSave(),
          child: const Text('Save Task'),
        ),
      ],
    );
  }
}
