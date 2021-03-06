import 'package:flutter/material.dart';
import 'package:onlineshopflutter/tabs/category_tab.dart';
import 'package:onlineshopflutter/tabs/home_tab.dart';
import 'package:onlineshopflutter/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Categories"),
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 211, 118, 130),
          ),
          drawer: CustomDrawer(_pageController),
          body: CategoryTab(),
        ),
        Container(color: Colors.yellow),
        Container(color: Colors.redAccent),
      ],
    );
  }
}
