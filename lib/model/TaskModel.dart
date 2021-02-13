import 'package:flutter/material.dart';
import 'package:todo_practical/utils/Extensions.dart';

class TaskModel {
  int userId;
  int id;
  DateTime completedAt;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  TaskModel(
      {this.userId,
      this.id,
      this.completedAt,
      this.description,
      this.createdAt,
      this.updatedAt});

  TaskModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    id = json['id'];
    completedAt = json['completed_at'] != null
        ? DateTime.tryParse(json['completed_at'])
        : null;
    description = json['description'];
    createdAt = json['created_at'] != null
        ? DateTime.tryParse(json['created_at'])
        : null;
    updatedAt = json['updated_at'] != null
        ? DateTime.tryParse(json['updated_at'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = description;
    return data;
  }

  Widget getListItemWidget(BuildContext context,
      {Function(TaskModel) edit,
      Function(int) delete,
      Function(TaskModel) statusChange}) {
    GlobalKey<FormFieldState> _key = new GlobalKey();
    return StatefulBuilder(builder: (context, setState) {
      return Card(
        margin: EdgeInsets.symmetric(vertical: 6),
        child: InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    actions: [
                      FlatButton(
                        child: Text(
                          "Cancel",
                          style: Theme.of(ctx)
                              .textTheme
                              .button
                              .copyWith(color: Colors.grey),
                        ),
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                      ),
                      FlatButton(
                        child: Text("Update"),
                        onPressed: () {
                          _key.currentState.save();
                        },
                      ),
                    ],
                    content: Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        key: _key,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 5,
                        onFieldSubmitted: (val) {
                          if (!val.isEmptyOrNull) {
                            description = val;
                            Navigator.of(ctx).pop();
                            FocusScope.of(context).requestFocus(FocusNode());
                            edit.call(this);
                          }
                        },
                        onSaved: (val) {
                          if (!val.isEmptyOrNull) {
                            description = val;
                            Navigator.of(ctx).pop();
                            FocusScope.of(context).requestFocus(FocusNode());
                            edit.call(this);
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Edit",
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.teal)),
                        ),
                        autofocus: true,
                        initialValue: description,
                      ),
                    ),
                  );
                });
          },
          child: Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Checkbox(
                  value: completedAt != null,
                  onChanged: (val) {
                    statusChange.call(this);
                  },
                ),
                Expanded(
                  child: Text(
                    description ?? "",
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        decoration: completedAt == null
                            ? TextDecoration.none
                            : TextDecoration.lineThrough,
                        color:
                            completedAt == null ? Colors.black : Colors.grey),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return AlertDialog(
                            actions: [
                              FlatButton(
                                child: Text(
                                  "No",
                                  style: Theme.of(ctx)
                                      .textTheme
                                      .button
                                      .copyWith(color: Colors.grey),
                                ),
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                              ),
                              FlatButton(
                                child: Text("Yes"),
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                  delete.call(id);
                                },
                              ),
                            ],
                            content: Text("Are you sure want to remove?"),
                          );
                        });
                  },
                  icon: Icon(Icons.delete, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
