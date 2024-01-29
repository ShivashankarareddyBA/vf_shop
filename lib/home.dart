import 'package:flutter/material.dart';
import 'package:vf_shop/constants/colors.dart';
import 'package:vf_shop/constants/image_strings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: const BoxDecoration(
          color: grey,
        ),
        child: const Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Image(image: AssetImage(cucumbar))],
            )
          ],
        ),
      ),
    );
  }
}
