// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  final _$showProgressAtom = Atom(name: '_AuthStore.showProgress');

  @override
  bool get showProgress {
    _$showProgressAtom.reportRead();
    return super.showProgress;
  }

  @override
  set showProgress(bool value) {
    _$showProgressAtom.reportWrite(value, super.showProgress, () {
      super.showProgress = value;
    });
  }

  final _$taskListAtom = Atom(name: '_AuthStore.taskList');

  @override
  List<TaskModel> get taskList {
    _$taskListAtom.reportRead();
    return super.taskList;
  }

  @override
  set taskList(List<TaskModel> value) {
    _$taskListAtom.reportWrite(value, super.taskList, () {
      super.taskList = value;
    });
  }

  final _$getTaskListAsyncAction = AsyncAction('_AuthStore.getTaskList');

  @override
  Future<List<TaskModel>> getTaskList(BuildContext context) {
    return _$getTaskListAsyncAction.run(() => super.getTaskList(context));
  }

  final _$createTaskAsyncAction = AsyncAction('_AuthStore.createTask');

  @override
  Future<TaskModel> createTask(BuildContext context, TaskModel taskModel) {
    return _$createTaskAsyncAction
        .run(() => super.createTask(context, taskModel));
  }

  final _$updateTaskAsyncAction = AsyncAction('_AuthStore.updateTask');

  @override
  Future<TaskModel> updateTask(BuildContext context, TaskModel taskModel) {
    return _$updateTaskAsyncAction
        .run(() => super.updateTask(context, taskModel));
  }

  final _$deleteTaskAsyncAction = AsyncAction('_AuthStore.deleteTask');

  @override
  Future<bool> deleteTask(BuildContext context, int id) {
    return _$deleteTaskAsyncAction.run(() => super.deleteTask(context, id));
  }

  final _$completeTaskAsyncAction = AsyncAction('_AuthStore.completeTask');

  @override
  Future<TaskModel> completeTask(BuildContext context, int taskId) {
    return _$completeTaskAsyncAction
        .run(() => super.completeTask(context, taskId));
  }

  final _$unCompleteTaskAsyncAction = AsyncAction('_AuthStore.unCompleteTask');

  @override
  Future<TaskModel> unCompleteTask(BuildContext context, int taskId) {
    return _$unCompleteTaskAsyncAction
        .run(() => super.unCompleteTask(context, taskId));
  }

  @override
  String toString() {
    return '''
showProgress: ${showProgress},
taskList: ${taskList}
    ''';
  }
}
