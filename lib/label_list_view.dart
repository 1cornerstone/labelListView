import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:label_listview/list_alpha_header.dart';
import 'package:label_listview/side_alphabet.dart';

import 'constants.dart';

class LabelListView extends StatefulWidget {
  const LabelListView({Key? key}) : super(key: key);

  @override
  _LabelListViewState createState() => _LabelListViewState();
}

class _LabelListViewState extends State<LabelListView> {


  String char="a";
 late List<String> _items;
 late ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = ScrollController()
      ..addListener(() {

      //  print("offset = ${_controller.position.pixels}");


      });

    _items = converter(items);


  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:  Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05 ),
        child: Row(
          children: [

            Expanded(
              child: Column(
                children: [

                  const Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: ListAlphaHeader(text:"A"),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount:_items.length ,
                        controller: _controller,
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext builder,int index){
                          return Container(
                            margin: const EdgeInsets.only(left: 15),
                            child:  (_items[index].length ==1) ?
                            ListAlphaHeader(text: _items[index][0])
                                :Container(
                              padding:  const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                              margin: const EdgeInsets.symmetric(vertical: 1),
                              child: Text(
                                _items[index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500
                                ),
                              ),),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: Colors.black38
                                    )
                                )
                            ),
                          );

                        }),
                  ),
                ],
              ),
            ),

            const SideAlphabet()

          ],
        ),
      ),
    );
  }




 List<String> converter(List<String> items){

    List<String> _list =[];
    items  =formatItemInList(items);
    items.sort();
    var char="";

    for (var element in items) {
      if(element[0].toLowerCase() !=char){
          char = element[0].toLowerCase();
          _list.addAll([char.toUpperCase(),element]);

      }else{
        _list.add(element);
      }
    }
    return _list;
  }
  
  String convertFirstLetterToUpperCase(String text){
    String _text ="";

    for( var i=0;  i < text.split('').length; i++){
        if(i==0){
          _text+=text.split('')[i].toUpperCase();
        }else{
          _text+=text.split('')[i].toLowerCase();
        }
    }
    return _text;

  }

 List<String> formatItemInList(List<String> strings){

      List<String> _list =[];
     strings.forEach((e){
       _list.add(convertFirstLetterToUpperCase(e));
     });

     return _list;
  }


  @override
  void dispose() {
    _controller.dispose(); // it is a good practice to dispose the controller
    super.dispose();
  }


}
