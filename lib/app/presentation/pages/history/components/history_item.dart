import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_wise/app/data/models/board_task_model.dart';
import 'package:time_wise/app/domain/entities/board_task.dart';
import 'package:time_wise/app/presentation/blocs/history/history_bloc.dart';
import 'package:time_wise/app/presentation/pages/history/components/summary.dart';

import '../../home/components/board_item.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    required this.item,
    super.key,
  });

  final BoardTaskEntity item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //modal bottom sheet with details
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return BlocProvider(
                create: (BuildContext context) => HistoryBloc(),
                child: ItemSummary(
                  item: item,
                ),
              );
            });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 5,
          ),
          if (item.columnName == MainColumnNames.done)
            const Icon(
              Icons.album,
              color: Colors.green,
            ),
          if (item.columnName == MainColumnNames.doing)
            const Icon(
              Icons.album,
              color: Colors.orange,
            ),
          if (item.columnName == MainColumnNames.todo)
            const Icon(
              Icons.album,
              color: Colors.blue,
            ),
          BoardItemCard(
            itemObject: item,
          ),
        ],
      ),
    );
  }
}
