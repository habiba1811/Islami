import 'package:flutter/material.dart';

import '../const_app_theme/my_theme_data.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;

  List<String> taspeha = [
    'سبحان الله ',
    'الحمد لله',
    'لا اله الا الله',
    'الله أكبر',
    'استغفر الله'
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: InkWell(
                  onTap: () {
                    if (count < 33) {
                      if (index == taspeha.length) {
                        index = 0;
                      }
                      count++;
                      taspeha[index];
                      setState(() {});
                    } else {
                      count = 0;
                      index++;
                      taspeha[index];
                      setState(() {});
                    }
                  },
                  child: Image.asset('assets/images/sep7a.png')),
            ),
            const SizedBox(
              height: 41.0,
            ),
            Text(
              'عدد التسبيحات',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 34,
            ),
            SizedBox(
              height: 81,
              width: 69,
              child: Card(
                  color: MyThemeData.primary,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                  child: Center(child: Text('$count'))),
            ),
            const SizedBox(
              height: 22,
            ),
            SizedBox(
              height: 51,
              width: 200,
              child: Card(
                color: MyThemeData.primary,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                child: Center(
                  child: Text(
                    taspeha[index],
                    style: const TextStyle(
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
