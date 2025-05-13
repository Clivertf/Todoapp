import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';
import '../providers/task_provider.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: ListTile(
        key: ValueKey(task.id),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Priority: ${task.priority} | Category: ${task.category}',
        ),
        trailing: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Checkbox(
            key: ValueKey(task.isCompleted),
            value: task.isCompleted,
            onChanged: (_) => taskProvider.toggleCompletion(task.id),
          ),
        ),
        onLongPress: () => taskProvider.deleteTask(task.id),
      ),
    );
  }
}
