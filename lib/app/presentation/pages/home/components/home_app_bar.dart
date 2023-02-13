import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/theme_type_provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          const Text(
            'Time Wise',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
         const  Spacer(),



          //icon button that will switch theme mode thanks to ThemeProvider and switch icon based on theme mode
          IconButton(
            icon: Icon(
              context.watch<ThemeProvider>().themeMode == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              context.read<ThemeProvider>().setThemeMode(context.read<ThemeProvider>().themeMode != ThemeMode.dark);
            },
          ),
          const SizedBox(
            width: 20,
          ),



        ],
      ),
    );
  }
}
