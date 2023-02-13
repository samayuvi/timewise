import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:time_wise/app/data/models/board_task_model.dart';
import 'package:time_wise/app/domain/entities/board_task.dart';
import 'package:time_wise/app/presentation/providers/history_provider.dart';
import 'package:time_wise/generated/locale_keys.g.dart';

class ItemSummary extends StatelessWidget {
  const ItemSummary({
    required this.item,
    super.key,
  });

  final BoardTaskEntity item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              LocaleKeys.summary.tr(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                 LocaleKeys.status.tr(),
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                Row(
                  children: [
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
                    if (item.columnName == MainColumnNames.done)
                      const Icon(
                        Icons.album,
                        color: Colors.yellow,
                      ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      item.columnName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Text(
                 LocaleKeys.start_date.tr(),
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                Text(DateFormat.yMMMd().format(item.creationDate)),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            if (item.doneDate != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.completed_date.tr(),
                    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Text(DateFormat.yMMMd().format(item.doneDate!)),
                ],
              ),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.total_time_spent.tr(),
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                Text(HistoryProvider()
                    .calculateTotalTimeForHistory(item)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
