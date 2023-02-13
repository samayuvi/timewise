import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_wise/app/presentation/providers/history_provider.dart';
import 'package:time_wise/generated/locale_keys.g.dart';

class HistoryAppbar extends StatelessWidget implements PreferredSizeWidget
{
  const HistoryAppbar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(LocaleKeys.history.tr()),
      // white drop down menu to filter by status
      actions: [
        PopupMenuButton(
          color: Theme.of(context).primaryColor,
          icon: Icon(Icons.filter_list,color: Theme.of(context).secondaryHeaderColor,),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Row(
                children: [
                  const Icon(Icons.album, color: Colors.green,),
                  const SizedBox(width: 10,),
                  Text(LocaleKeys.done.tr(), style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
              onTap: () {
                context.read<HistoryProvider>().filterType = FilterType.done;
              },
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  const Icon(Icons.album, color: Colors.orange,),
                  const SizedBox(width: 10,),
                  Text(LocaleKeys.doing.tr(), style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              onTap: () {
                context.read<HistoryProvider>().filterType = FilterType.doing;
              },
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  const Icon(Icons.album, color: Colors.blue,),
                  const SizedBox(width: 10,),
                  Text(LocaleKeys.to_do.tr(), style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
              onTap: (){
                context.read<HistoryProvider>().filterType = FilterType.todo;
              },
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  Text(LocaleKeys.all.tr(), style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
              onTap: (){
                context.read<HistoryProvider>().filterType = FilterType.all;
              },
            ),
            PopupMenuItem(
              child: Row(
                children:  [
                  Text(LocaleKeys.undone.tr(), style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
              onTap: (){
                context.read<HistoryProvider>().filterType = FilterType.undone;
              },
            ),
          ],
        ),
      ],
    );
  }
}