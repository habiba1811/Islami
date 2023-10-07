import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 175,
          ),
          Image.asset('assets/images/radio_image.png'),
          const SizedBox(
            height: 55,
          ),
          const Text('إذاعة القرآن الكريم'),
          const SizedBox(
            height: 65,
          ),
          Image.asset('assets/images/icons.png'),
        ],
      ),
    );
  }
}
//provider.theme == ThemeMode.light
//                         ? "assets/images/background.png"
//                         : 'assets/images/darkback.png',
