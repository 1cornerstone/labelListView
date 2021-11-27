

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:label_listview/constants.dart';

class SideAlphabet extends StatelessWidget {

  const SideAlphabet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.0,
      //alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 3.0,),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children:List.generate(label.length, (index) =>GestureDetector(
          onTap: (){

          },
          onPanUpdate: (detail){
            //print(detail.localPosition.dy);
          },
          child: Text(
            label[index],
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                decorationStyle: TextDecorationStyle.wavy
            ),
          ),
        )),

      ),
    );
  }
}
