import 'package:task_board/data/models/task.dart';

abstract class TaskRepository {

  Future<List<Task>> getTasks();

  Future<Task> getTask(String id);

  Future<void> createTask(Task task);

  Future<void> editTask(String id, Task task);

  Future<void> deleteTask(String id);
}