import 'package:todo_practical/constants/Globals.dart' as globals;
import 'package:todo_practical/model/TaskModel.dart';

import 'DioClient.dart';

class APIs {
  static Future<List<TaskModel>> getTaskList() async {
    var resp =
        await DioClient.getClient().get("api/v1/users/${globals.userId}/tasks");
    if (resp.data != null) {
      return resp.data.map<TaskModel>((e) => TaskModel.fromJson(e)).toList();
    } else {
      throw resp;
    }
  }

  static Future<TaskModel> createTask(TaskModel taskModel) async {
    var resp = await DioClient.getClient()
        .post("api/v1/users/${globals.userId}/tasks", data: taskModel.toJson());
    if (resp.data != null) {
      return TaskModel.fromJson(resp.data);
    } else {
      throw resp;
    }
  }

  static Future<TaskModel> fetchTask(int taskId) async {
    var resp = await DioClient.getClient()
        .get("api/v1/users/${globals.userId}/tasks/$taskId");
    if (resp.statusCode == 200) {
      return TaskModel.fromJson(resp.data);
    } else {
      throw resp;
    }
  }

  static Future<TaskModel> updateTask(TaskModel taskModel) async {
    var resp = await DioClient.getClient().put(
        "api/v1/users/${globals.userId}/tasks/${taskModel.id}",
        data: taskModel.toJson());
    if (resp.statusCode == 200) {
      return TaskModel.fromJson(resp.data);
    } else {
      throw resp;
    }
  }

  static Future<bool> deleteTask(int id) async {
    var resp = await DioClient.getClient()
        .delete("api/v1/users/${globals.userId}/tasks/$id");
    if (resp.statusCode == 204) {
      return true;
    } else {
      throw resp;
    }
  }

  static Future<TaskModel> completeTask(int id) async {
    var resp = await DioClient.getClient()
        .put("api/v1/users/${globals.userId}/tasks/$id/completed");
    if (resp.statusCode == 200) {
      return TaskModel.fromJson(resp.data);
    } else {
      throw resp;
    }
  }

  static Future<TaskModel> unCompleteTask(int id) async {
    var resp = await DioClient.getClient()
        .put("api/v1/users/${globals.userId}/tasks/$id/uncompleted");
    if (resp.statusCode == 200) {
      return TaskModel.fromJson(resp.data);
    } else {
      throw resp;
    }
  }
}
