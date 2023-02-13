import 'package:flutter/material.dart';
import 'package:time_wise/utils/localization.dart';

import '../../../../domain/entities/board_list_entity.dart';

class BoardListHeader extends StatelessWidget {

  const BoardListHeader({Key? key, required this.list}) : super(key: key);

  final BoardListEntity list;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Text(
                Localization().convertTypesToLocal(list.title),
              style: Theme.of(context).textTheme.headlineMedium,
            )));
  }
}
