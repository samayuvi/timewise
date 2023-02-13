//ui class that takes in a list of history items and displays them in a list view
// filtering by date and type To Do, Doing, Done

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/history_provider.dart';
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
          child: Consumer<HistoryProvider>(
            builder: (context, provider, child) {
              List history = provider.currentTasks;
              return ListView.builder(
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    return HistoryItem(item: history[index]);
                  });
            },
          ),
        ),
      ),
    );
  }
}
