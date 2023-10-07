import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../bottom_sheets/show_language_bottom_sheet.dart';
import '../bottom_sheets/show_theming_bottom_sheet.dart';
import '../const_app_theme/my_theme_data.dart';
import '../providers/my_provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language),
          InkWell(
            onTap: () {
              showLanguageBottomSheet(context);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: MyThemeData.primary,
                  )),
              child: provider.local == 'en'
                  ? Text(AppLocalizations.of(context)!.english)
                  : Text(AppLocalizations.of(context)!.arabic),
            ),
          ),
          SizedBox(
            height: 18.0,
          ),
          Text(AppLocalizations.of(context)!.mode),
          InkWell(
            onTap: () {
              showThemeingBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: MyThemeData.primary,
                  )),
              child: Text(provider.theme == ThemeMode.light
                  ? AppLocalizations.of(context)!.light
                  : AppLocalizations.of(context)!.dark),
            ),
          ),
        ],
      ),
    );
  }

  showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18.0),
          ),
          borderSide: BorderSide(color: Colors.transparent)),
      //xisScrollControlled: true,
      builder: (context) {
        return LanguageBottomSheet();
      },
    );
  }

  showThemeingBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18.0),
          ),
          borderSide: BorderSide(color: Colors.transparent)),
      //isScrollControlled: true,
      builder: (context) {
        return ThemingBottomSheet();
      },
    );
  }
}
