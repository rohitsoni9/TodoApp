import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_practical/api/CommonAPIs.dart';
import 'package:todo_practical/api/DioClient.dart';
import 'package:todo_practical/model/TaskModel.dart';

part 'AuthStore.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  bool showProgress;

  @observable
  List<TaskModel> taskList;

  @action
  Future<List<TaskModel>> getTaskList(BuildContext context) async {
    try {
      showProgress = true;
      List<TaskModel> data = await APIs.getTaskList();
      List<TaskModel> unCompleted =
          data.where((e) => e.completedAt == null).toList();
      unCompleted.sort((a, b) {
        return b.createdAt.compareTo(a.createdAt);
      });
      List<TaskModel> completed =
          data.where((e) => e.completedAt != null).toList();
      completed.sort((a, b) {
        return a.completedAt.compareTo(b.completedAt);
      });
      unCompleted.addAll(completed);
      taskList = unCompleted;
    } catch (ex) {
      showErrorDialog(context, ex);
    } finally {
      showProgress = false;
    }
    return taskList;
  }

  @action
  Future<TaskModel> createTask(
      BuildContext context, TaskModel taskModel) async {
    TaskModel task;
    try {
      showProgress = true;
      task = await APIs.createTask(taskModel);
      await getTaskList(context);
    } catch (ex) {
      showErrorDialog(context, ex);
    } finally {
      showProgress = false;
    }
    return task;
  }

  @action
  Future<TaskModel> updateTask(
      BuildContext context, TaskModel taskModel) async {
    TaskModel task;
    try {
      showProgress = true;
      task = await APIs.updateTask(taskModel);
      await getTaskList(context);
    } catch (ex) {
      showErrorDialog(context, ex);
    } finally {
      showProgress = false;
    }
    return task;
  }

  @action
  Future<bool> deleteTask(BuildContext context, int id) async {
    bool result;
    try {
      showProgress = true;
      result = await APIs.deleteTask(id);
      await getTaskList(context);
    } catch (ex) {
      showErrorDialog(context, ex);
    } finally {
      showProgress = false;
    }
    return result;
  }

  @action
  Future<TaskModel> completeTask(BuildContext context, int taskId) async {
    TaskModel task;
    try {
      showProgress = true;
      task = await APIs.completeTask(taskId);
      await getTaskList(context);
    } catch (ex) {
      showErrorDialog(context, ex);
    } finally {
      showProgress = false;
    }
    return task;
  }

  @action
  Future<TaskModel> unCompleteTask(BuildContext context, int taskId) async {
    TaskModel task;
    try {
      showProgress = true;
      task = await APIs.unCompleteTask(taskId);
      await getTaskList(context);
    } catch (ex) {
      showErrorDialog(context, ex);
    } finally {
      showProgress = false;
    }
    return task;
  }
}
