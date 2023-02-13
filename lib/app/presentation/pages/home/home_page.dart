import 'package:flutter/material.dart';
import 'package:time_wise/app/presentation/pages/home/components/add_item_button.dart';
import 'package:time_wise/app/presentation/pages/home/components/board_view.dart';

import 'components/home_app_bar.dart';
import 'components/side_menu.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const SideMenu(),
      appBar: const HomeAppBar(),
      body: BoardViewExample(),
      floatingActionButton: const AddItemButton(),
    );
  }
}







