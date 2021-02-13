import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_practical/model/TaskModel.dart';
import 'package:todo_practical/store/AuthStore.dart';
import 'package:todo_practical/utils/Extensions.dart';
import 'package:todo_practical/constants/Globals.dart' as globals;
import 'package:todo_practical/widgets/ProgressContainerView.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  AuthStore authStore = new AuthStore();
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    authStore.getTaskList(context);
  }

  Future<void> addTask() async {
    if (!textEditingController.text.isEmptyOrNull)
      authStore
          .createTask(
              context,
              TaskModel(
                userId: globals.userId,
                description: textEditingController.text,
              ))
          .then((val) {
        textEditingController.clear();
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Todo's"),
        actions: [
          IconButton(
            onPressed: () async {
              await authStore.getTaskList(context);
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: Observer(builder: (_) {
        return ProgressContainerView(
          isProgressRunning: authStore.showProgress ?? false,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: textEditingController,
                  onSubmitted: (val) async {
                    await addTask();
                  },
                  decoration: InputDecoration(
                      hintText: " Add to list...",
                      suffixIcon: IconButton(
                        onPressed: () async {
                          await addTask();
                        },
                        icon: Icon(Icons.add),
                      )),
                ),
                SizedBox(height: 22),
                (authStore?.taskList?.length ?? 0) > 0
                    ? Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "My TODO's",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            SizedBox(height: 8),
                            Expanded(
                              child: ListView.builder(
                                itemCount: authStore?.taskList?.length ?? 0,
                                shrinkWrap: true,
                                itemBuilder: (ctx, i) {
                                  return authStore?.taskList[i]
                                      ?.getListItemWidget(ctx,
                                          delete: (id) async {
                                    await authStore.deleteTask(context, id);
                                  }, edit: (desc) async {
                                    await authStore.updateTask(context, desc);
                                  }, statusChange: (data) async {
                                    if (data.completedAt == null) {
                                      await authStore.completeTask(
                                          context, data?.id);
                                    } else {
                                      await authStore.unCompleteTask(
                                          context, data?.id);
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    : Center(child: Text("No TODO's"))
              ],
            ),
          ),
        );
      }),
    );
  }
}
