import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../const_app_theme/my_theme_data.dart';
import '../providers/my_provider.dart';

class ThemingBottomSheet extends StatelessWidget {
  ThemingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.changeMode(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.light,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(
                      color: provider.theme == ThemeMode.light ? Theme
                          .of(context)
                          .colorScheme
                          .background : Theme
                          .of(context)
                          .colorScheme
                          .onPrimary
                  ),
                ),
                provider.theme == ThemeMode.light
                    ? Icon(
                  Icons.done,
                  color: MyThemeData.primary,
                )
                    : SizedBox.shrink(),
              ],
            ),
          ),
          SizedBox(
            height: 18,
          ),
          InkWell(
            onTap: () {
              provider.changeMode(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.dark,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(
                      color: provider.theme == ThemeMode.dark ? Theme
                          .of(context)
                          .colorScheme
                          .background : Theme
                          .of(context)
                          .colorScheme
                          .onPrimary
                  ),
                ),
                provider.theme == ThemeMode.dark
                    ? Icon(
                  Icons.done,
                  color: MyThemeData.primary,
                )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
