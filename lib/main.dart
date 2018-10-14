import 'package:flutter/material.dart';
import 'package:one_two_quest/discount-page.dart';
import 'package:one_two_quest/list_promo.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(text: "КАРТА"),
                    Tab(text: "МОИ КУПОНЫ"),
                  ],
                ),
                title: Text('OneTwoQuest'),
              ),
              body: TabBarView(children: [
                ListPromo(),
                DiscountPage()
              ])
          )
      )
    );
  }
}
