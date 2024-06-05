import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rusquant_todo_app_dev_v1/models/task_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/todos')
  Future<List<TaskModel>> getTodos();
}
