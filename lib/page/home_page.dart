import 'package:flutter/material.dart';

import '../utile/smart_divece_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalPadding = 20;
  final double verticalPadding = 20;

  List mySmart = [
    ["smart light", "lib/icons/light-bulb.png", true],
    ["smart light", "lib/icons/air-conditioner.png", false],
    ["smart light", "lib/icons/smart-tv.png", false],
    ["smart light", "lib/icons/fan.png", true],
  ];

  void powerSwitchChanged(bool value,int index) {
    setState(() {
      mySmart[index][2]=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding/2, vertical: verticalPadding/2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),
            SizedBox(
              height: verticalPadding / 7,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Welcome Home",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    ""
                        "Ali Shekfeh",
                    style: TextStyle(fontSize: 30, color: Colors.red),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: verticalPadding / 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                height: 3,
                color: Colors.red[300],
              ),
            ),
            SizedBox(
              height: verticalPadding / 3,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const Text(
                "Smart Devices :",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic),
              ),
            ),

            Expanded(
                child: GridView.builder(
                    itemCount: mySmart.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: SmartDeviceBox(
                          smartDeviceName: mySmart[index][0],
                          iconBath: mySmart[index][1],
                          powerOn: mySmart[index][2],
                          onChange: (value) => powerSwitchChanged(value,index),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
