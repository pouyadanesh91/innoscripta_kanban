import 'package:retrofit/retrofit.dart';
import 'package:task_board/data/models/task.dart';
import 'package:dio/dio.dart';

part 'task_api.g.dart';

@RestApi()
abstract class TaskApi {
  factory TaskApi(Dio dio, {String baseUrl}) = _TaskApi;

  @GET("/tasks")
  Future<List<Task>> getTasks();

  @GET("/tasks/{id}")
  Future<Task> getTask(@Path("id") String id);

  @POST("/tasks")
  Future<void> createTask(@Body() Task task);

  @POST("/tasks/{id}")
  Future<void> editTask(@Path("id") String id ,@Body() Task task);

  @DELETE("/tasks/{id}")
  Future<void> deleteTask(@Path("id") String id);
}

class TaskNotFoundException implements Exception {}
