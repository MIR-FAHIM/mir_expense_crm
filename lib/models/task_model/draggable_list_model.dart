import 'package:mir_expense_tracker/models/task_model/task_item_model.dart';
import 'package:mir_expense_tracker/screens/Tasks/dragableTasks/model_drag.dart';

class DraggableListModel {
  final HeaderModel header;
  final List<TaskModel> items;

  const DraggableListModel({
    required this.header,
    required this.items,
  });
}
