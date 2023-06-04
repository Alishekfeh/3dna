import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;

  final String iconBath;

  final bool powerOn;
  final void Function(bool)? onChange;

  const SmartDeviceBox(
      {Key? key,
      required this.smartDeviceName,
      required this.iconBath,
      required this.powerOn, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            color:powerOn?Colors.black54: Colors.grey[200], borderRadius: BorderRadius.circular(24)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              iconBath,
              height: 65,
                color: powerOn?Colors.white:Colors.black
            ),
            Row(

              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                  smartDeviceName,
                  style:  TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20,color: powerOn?Colors.white:Colors.black),
                ),
                    )),
                 Container(width: 5,),
                Transform.rotate(
                  angle: pi / 2,
                  child: CupertinoSwitch(value: powerOn, onChanged: onChange),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
