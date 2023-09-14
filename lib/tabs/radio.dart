import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

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
      ),
    );
  }
}
