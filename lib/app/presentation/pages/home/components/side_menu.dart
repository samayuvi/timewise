import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_wise/app/presentation/navigation/main_navigation.dart';
import 'package:time_wise/app/presentation/providers/auth/logout_provider.dart';
import 'package:time_wise/app/presentation/providers/board_data_provider.dart';
import 'package:time_wise/app/presentation/providers/theme_type_provider.dart';

import 'language_choose_modal_widget.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(MainNavigationRouteNames.history);
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.history,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: const Text('History'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<BoardDataService>().exportToCSV();
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.download,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: const Text('Download CSV'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<ThemeProvider>().setThemeMode(
                        context.read<ThemeProvider>().themeMode !=
                            ThemeMode.dark);
                  },
                  child: ListTile(
                    leading: Icon(
                      context.watch<ThemeProvider>().themeMode == ThemeMode.dark
                          ? Icons.light_mode
                          : Icons.dark_mode,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: const Text('Change Theme'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const LanguageChooseModalWidget();
                        });
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.language,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: const Text('Choose Language'),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                context.read<LogoutService>().signout();
              },
              child: const ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text('Logout', style: TextStyle(color: Colors.red)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


