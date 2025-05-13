import 'package:flutter/foundation.dart';
import '../models/task_model.dart';
import '../utils/storage_helper.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  TaskProvider() {
    _loadTasks();
  }

  // Load tasks from local storage when the provider is initialized
  Future<void> _loadTasks() async {
    _tasks = await StorageHelper.loadTasks();
    notifyListeners();
  }

  // Add a new task and save to local storage
  void addTask(Task task) {
    _tasks.add(task);
    StorageHelper.saveTasks(_tasks);
    notifyListeners();
  }

  // Update a task and save changes to local storage
  void updateTask(Task updatedTask) {
    final index = _tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      _tasks[index] = updatedTask;
      StorageHelper.saveTasks(_tasks);
      notifyListeners();
    }
  }

  // Delete a task and update local storage
  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    StorageHelper.saveTasks(_tasks);
    notifyListeners();
  }

  // Toggle task completion and update local storage
  void toggleCompletion(String id) {
    final task = _tasks.firstWhere((task) => task.id == id);
    task.isCompleted = !task.isCompleted;
    StorageHelper.saveTasks(_tasks);
    notifyListeners();
  }
}
