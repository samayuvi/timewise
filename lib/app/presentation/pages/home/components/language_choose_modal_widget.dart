import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageChooseModalWidget extends StatelessWidget {
  const LanguageChooseModalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: 200,
      child: Column(
        children: [
          ListTile(
            title: Text(
              'English',
              style:
              Theme.of(context).textTheme.bodyMedium,
            ),
            onTap: () {
              context.setLocale(const Locale('en', 'US'));
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Français',
              style:
              Theme.of(context).textTheme.bodyMedium,
            ),
            onTap: () {
              context.setLocale(const Locale('fr', 'FR'));
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}