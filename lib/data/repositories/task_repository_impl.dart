import 'package:task_board/data/data_providers/task_api.dart';
import 'package:task_board/data/models/task.dart';
import 'package:task_board/data/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  TaskRepositoryImpl({
    required TaskApi taskApi,
  }): _taskApi = taskApi;

  late final TaskApi _taskApi;

  @override
  Future<List<Task>> getTasks() {
    return _taskApi.getTasks();
  }

  @override
  Future<Task> getTask(String id) {
    return _taskApi.getTask(id);
  }

  @override
  Future<void> createTask(Task task) {
    return _taskApi.createTask(task);
  }

  @override
  Future<void> editTask(String id, Task task) {
    return _taskApi.editTask(id, task);
  }

  @override
  Future<void> deleteTask(String id) {
    return _taskApi.deleteTask(id);
  }
}