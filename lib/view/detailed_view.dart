import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:setstate_demo/model/product_model.dart';

class DetailedView extends StatefulWidget {
  const DetailedView({Key? key,required this.reciever}) : super(key: key);
  final dynamic reciever ;

  @override
  State<DetailedView> createState() => _DetailedViewState();

}

class _DetailedViewState extends State<DetailedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<ProductModel>>(builder: (context, snapshot) {
        return ListView(children: [
          Text(widget.reciever
          .title,style: TextStyle(fontWeight: FontWeight.bold,fontSize:25 ),),
          Container(
            height: MediaQuery.of(context).size.height/4,
            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(widget.reciever.images.toString()))),)
        ],);
      },),
    );
  }
}