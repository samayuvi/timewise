import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_wise/app/domain/factories/screen_factory.dart';
import 'package:time_wise/app/presentation/blocs/board_data/board_data_bloc.dart';

class AddItemButton extends StatelessWidget {
  const AddItemButton({super.key});

  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
      onPressed: () async {
        await showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            builder: (context) {
              return ScreenFactory().makeAddTaskForm();
            });
        // ignore: use_build_context_synchronously
        context.read<BoardDataBloc>().add(GetBoardDataEvent());
         },
      child: const Icon(Icons.add),
    );
  }
}



