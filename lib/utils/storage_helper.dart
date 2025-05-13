import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task_model.dart';

class StorageHelper {
  static const String _tasksKey = 'tasks';

  // Save tasks to local storage
  static Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> taskStrings =
        tasks.map((task) => json.encode(task.toJson())).toList();
    await prefs.setStringList(_tasksKey, taskStrings);
  }

  // Load tasks from local storage
  static Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskStrings = prefs.getStringList(_tasksKey);
    if (taskStrings == null || taskStrings.isEmpty) {
      return [];
    }
    return taskStrings
        .map((taskString) => Task.fromJson(json.decode(taskString)))
        .toList();
  }

  // Delete all tasks from local storage
  static Future<void> deleteAllTasks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tasksKey);
  }
}
