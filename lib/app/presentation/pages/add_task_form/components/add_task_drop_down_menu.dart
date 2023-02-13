import 'package:flutter/material.dart';
import 'package:time_wise/app/data/models/board_task_model.dart';
import 'package:time_wise/app/domain/entities/board_list_entity.dart';
import 'package:time_wise/utils/localization.dart';

class AddTaskDropDownMenu extends StatelessWidget {
  const AddTaskDropDownMenu({Key? key, required this.dropdownValue, required this.onChanged, required this.items}) : super(key: key);
  final String dropdownValue;
  final Function(String?)? onChanged;
  final List<BoardListEntity> items;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      underline: Container(
        height: 2,
        color: Theme.of(context).cardTheme.color,
      ),
      onChanged: onChanged,
      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
      items: items
          .map<DropdownMenuItem<String>>(
              (BoardListEntity value) {
            return DropdownMenuItem<String>(
              value: value.title,
              child: Row(
                children: [
                  if (value.title == MainColumnNames.done)
                    const Icon(
                      Icons.album,
                      color: Colors.green,
                    ),
                  if (value.title == MainColumnNames.doing)
                    const Icon(
                      Icons.album,
                      color: Colors.orange,
                    ),
                  if (value.title == MainColumnNames.todo)
                    const Icon(
                      Icons.album,
                      color: Colors.blue,
                    ),
                  const SizedBox(
                    height: 18,
                    width: 9,
                  ),
                  Text(
                    Localization().convertTypesToLocal(value.title),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }
}

