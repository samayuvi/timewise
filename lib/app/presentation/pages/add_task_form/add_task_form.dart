import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_wise/app/data/models/board_task_model.dart';
import 'package:time_wise/app/domain/entities/board_task.dart';
import 'package:time_wise/app/presentation/blocs/board_data/board_data_bloc.dart';
import 'package:time_wise/generated/locale_keys.g.dart';

import 'components/add_task_button.dart';
import 'components/add_task_drop_down_menu.dart';
import 'components/add_task_form_input.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({Key? key}) : super(key: key);

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  String dropdownValue = MainColumnNames.todo;
  String itemTitle = "";
  String itemFrom = "";

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                right: 16.0,
                left: 16.0,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 18.0),
                AddTaskFormInput(
                    onChanged: (value) {
                      itemTitle = value;
                    },
                    hintText: LocaleKeys.item_title.tr()),
                const SizedBox(height: 18.0),
                AddTaskFormInput(
                  onChanged: (value) {
                    itemFrom = value;
                  },
                  hintText: LocaleKeys.item_from.tr(),
                ),
                const SizedBox(height: 18.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: BlocBuilder<BoardDataBloc,BoardDataState>(builder: (context, state) {
                    if(state is BoardDataInitial) {
                      context.read<BoardDataBloc>().add(GetBoardDataEvent());
                      return const CircularProgressIndicator();
                    }
                    if(state is BoardDataLoaded) {
                      return AddTaskDropDownMenu(dropdownValue: dropdownValue,
                        onChanged: (String? value) {
                          dropdownValue = value!;
                          setState(() {});
                        }, items: state.boardListEntity);
                    }
                    if(state is BoardDataError) {
                      return const Text("Error");
                    }
                    if(state is BoardDataLoading) {
                      return const CircularProgressIndicator();
                    }
                    return const Text("There is some trouble :(");


                  }),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Center(
                  child: AddTaskButton(onPressed: () {
                    context.read<BoardDataBloc>().add(AddBoardItemEvent(columnName: dropdownValue, boardTaskEntity: BoardTaskEntity(
                        columnName: dropdownValue,
                        title: itemFrom,
                        from: itemTitle,
                        creationDate: DateTime.now())));

                    Navigator.pop(context);
                  },),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
