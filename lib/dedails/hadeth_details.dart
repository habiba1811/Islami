import 'package:flutter/material.dart';
import 'package:islami_c9_mon/providers/hadeth_details_provider.dart';
import 'package:islami_c9_mon/providers/my_provider.dart';
import 'package:provider/provider.dart';

import '../const_app_theme/my_theme_data.dart';
import '../models/hadeth_model.dart';

class HadethDetails extends StatefulWidget {
  const HadethDetails({super.key});

  static const String routeName = 'hadethDetails';

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return ChangeNotifierProvider(
      create: (context) => HadethDetailsProvider()..loadHadeth(),
      builder: (context, child) {
        var pro = Provider.of<HadethDetailsProvider>(context);
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
                args.title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            body: Card(
              elevation: 14,
              margin: const EdgeInsets.all(18),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(color: MyThemeData.primary)),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 1,
                    endIndent: 40,
                    indent: 40,
                  ),
                  itemBuilder: (context, index) {
                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        args.content[index],
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                  itemCount: args.content.length,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
