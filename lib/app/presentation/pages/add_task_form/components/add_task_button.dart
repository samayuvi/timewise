
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:time_wise/app/domain/entities/board_task.dart';
import 'package:time_wise/app/presentation/providers/board_data_provider.dart';
import 'package:time_wise/generated/locale_keys.g.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    super.key,
    required this.boardDataService,
    required this.dropdownValue,
    required this.itemTitle,
    required this.itemFrom,
  });

  final BoardDataService boardDataService;
  final String dropdownValue;
  final String itemTitle;
  final String itemFrom;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        boardDataService.addItem(
            dropdownValue,
            BoardTaskEntity(
                columnName: dropdownValue,
                title: itemTitle,
                from: itemFrom,
                creationDate: DateTime.now()));
        Navigator.pop(context);
      },
      child: Text(
        LocaleKeys.add_item.tr(),
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}