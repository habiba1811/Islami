import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c9_mon/dedails/hadeth_details.dart';
import 'package:islami_c9_mon/providers/hadeth_details_provider.dart';
import 'package:provider/provider.dart';

import '../const_app_theme/my_theme_data.dart';

class AhadethTab extends StatefulWidget {
  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HadethDetailsProvider()..loadHadeth(),
        builder: (context, child) {
          var pro = Provider.of<HadethDetailsProvider>(context);
          return Column(
            children: [
              Image.asset('assets/images/ahadeth_image.png'),
              const Divider(
                thickness: 3.0,
                color: MyThemeData.primary,
              ),
              Text(AppLocalizations.of(context)!.ahadeth),
              const Divider(
                thickness: 3.0,
                color: MyThemeData.primary,
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            HadethDetails.routeName,
                            arguments: pro.allAhadeth[index],
                          );
                        },
                        child: Text(
                          pro.allAhadeth[index].title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                          thickness: 1.0,
                          color: MyThemeData.primary,
                          endIndent: 40.0,
                          indent: 40.0,
                        ),
                    itemCount: pro.allAhadeth.length),
              )
            ],
          );
        });
  }
}