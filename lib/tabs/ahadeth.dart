import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c9_mon/dedails/hadeth_details.dart';
import 'package:islami_c9_mon/models/hadeth_model.dart';

import '../const_app_theme/my_theme_data.dart';

class AhadethTab extends StatefulWidget {
   AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    loadHadeth();
    return Column(
      children: [
        Image.asset('assets/images/ahadeth_image.png'),
        const Divider(
          thickness: 3.0,
          color: MyThemeData.primary,
        ),
        const Text('Ahadeth'),
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
                      arguments: allAhadeth[index],
                    );
                  },
                  child: Text(
                    allAhadeth[index].title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: MyThemeData.blackColor,
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
              itemCount: allAhadeth.length),
        )
      ],
    );
  }

loadHadeth() async {
    rootBundle.loadString('assets/files/ahadeth.txt').then((ahadeth) {
      List<String> ahadethList = ahadeth.split('#');
      for (int i = 0; i <= ahadethList.length; i++) {
        String hadethOne = ahadethList[i];
        List<String> hadethOneLines = hadethOne.trim().split('\n');
        String title = hadethOneLines[0];
        hadethOneLines.removeAt(0);
        List<String> content = hadethOneLines;
        HadethModel hadethModel = HadethModel(title, content);
        allAhadeth.add(hadethModel);
        print(title);
      }
      setState(() {});
    }).catchError((e) {
      print(e.toString());
    });
  }
}
