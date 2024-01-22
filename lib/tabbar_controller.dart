import 'package:flutter/material.dart';
import 'package:vf_shop/constants/colors.dart';
import 'package:vf_shop/constants/size.dart';
import 'package:vf_shop/constants/text_strings.dart';
import 'package:vf_shop/login_page/login.dart';
import 'package:vf_shop/login_page/signup.dart';

class TabBarController extends StatefulWidget {
  const TabBarController({Key? key}) : super(key: key);

  @override
  State<TabBarController> createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double tabTextSize = 20;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          title,
          style: TextStyle(color: titleColor),
        ),
        bottom: TabBar(
            controller: tabController,
            tabs: const [
              Tab(
                text: 'Login',
              ),
              Tab(text: 'Sign Up'),
            ],
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: titleColor,
            labelStyle:
                const TextStyle(fontSize: tabTextSize, color: titleColor)),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          // Add your content for Tab 1
          Login(),

          // Add your content for Tab 2
          SignUp(),
        ],
      ),
    );
  }
}
