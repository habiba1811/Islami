import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../const_app_theme/my_theme_data.dart';
import '../models/sura_model.dart';
import '../providers/my_provider.dart';
import '../providers/sura_details_provider.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "SuraDetails";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    // if (pro.verses.isEmpty) {
    //   pro.loadFile(args.index);
    // }

    return ChangeNotifierProvider(
      create: (context) => SuraDetailsProvider()..loadFile(args.index),
      builder: (context, child) {
        var pro = Provider.of<SuraDetailsProvider>(context);
        return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      provider.theme == ThemeMode.light
                          ? "assets/images/background.png"
                          : 'assets/images/darkback.png',
                    ),
                    fit: BoxFit.fill)),
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  args.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              body: Card(
                elevation: 14,
                margin: EdgeInsets.all(18),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: MyThemeData.primary)),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    thickness: 1,
                    endIndent: 40,
                    indent: 40,
                  ),
                  itemBuilder: (context, index) {
                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        "${pro.verses[index]}(${index + 1})",
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                  itemCount: pro.verses.length,
                ),
              ),
            ));
      },
    );
  }
}
