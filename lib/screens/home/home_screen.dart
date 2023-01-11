import 'package:flutter/material.dart';
import 'package:flutter_netflix/extension/string+extension.dart';
import 'package:flutter_netflix/screens/home/home_section.dart';
import 'package:flutter_netflix/screens/home/viewmodel/home_viewmodel.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool shadowColor = false;
  double? scrolledUnderElevation;

  var viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: Get.height * 0.6,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset("profile".png()),
              ),
            ),
            actions: [
              IconButton(
                icon: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset("profile".png()),
                ),
                onPressed: () {},
                iconSize: 44,
              )
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) =>
                  HomeSection(homeSectionType: viewModel.itemList[index]),
              childCount: viewModel.itemList.length,
            ),
          ),
        ],
      ),
    );
  }
}
