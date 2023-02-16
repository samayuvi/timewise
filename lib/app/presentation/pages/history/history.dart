//ui class that takes in a list of history items and displays them in a list view
// filtering by date and type To Do, Doing, Done

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_wise/app/presentation/blocs/history/history_bloc.dart';

import 'components/history_app_bar.dart';
import 'components/history_item.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  //build card of history item with date, type, and description

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *0.8,
      child: Scaffold(
        appBar: const HistoryAppbar(),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocBuilder<HistoryBloc, HistoryState>(
            builder: (context, state) {
                  if(state is HistoryInitial) {
                    context.read<HistoryBloc>().add(HistoryInitialEvent());
                    return const CircularProgressIndicator();
                  }
                  if(state is HistoryLoaded) {

                    return ListView.builder(
                        itemCount: state.boardItems.length,
                        itemBuilder: (context, index) {
                          return HistoryItem(item: state.boardItems[index]);
                        });
                  }
                  if(state is HistoryLoading) {
                    return const Center(child:  CircularProgressIndicator());
                  }
                  return const Center(child:  Text("Error loading history"));
            }
          ),
        ),
      ),
    );
  }
}
