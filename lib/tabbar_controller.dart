import 'package:flutter/material.dart';
import 'package:vf_shop/constants/colors.dart';
import 'package:vf_shop/constants/image_strings.dart';
import 'package:vf_shop/constants/text_strings.dart';
import 'package:vf_shop/widgets/login_page/login.dart';
import 'package:vf_shop/widgets/login_page/signup.dart';

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
    tabController = TabController(length: 2, vsync: this);
    super.initState();

    tabController.addListener(() {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (grey),
      body: Column(
        children: [
          Container(
            width: 400,
            height: 200,
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: const Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Image(image: AssetImage(regimg)),
                Image(image: AssetImage(strawberry)),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 400,
            height: 50,
            child: TabBar(
                labelColor: Colors.red,
                unselectedLabelColor: Colors.black,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: btncolor,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 6,
                controller: tabController,
                tabs: const [
                  Text(
                    bt1,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bt2,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [Login(), SignUp()],
            ),
          ),
        ],
      ),
    );
  }
}
