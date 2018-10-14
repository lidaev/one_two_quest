import 'package:flutter/material.dart';
import 'package:one_two_quest/discount-page.dart';
import 'package:one_two_quest/list_promo.dart';

void main() => runApp(new MyApp());

Map data = {
  "places": [
    {
      "title": "Окинава",
      "coordinates": {
        "lat": "55.788410",
        "lon": "49.121562"
      },
      "type": "Ресторан",
      "Rating": "4.5"
    },
    {
      "title": "Нефть",
      "coordinates": {
        "lat": "55.787861",
        "lon": "49.120184"
      },
      "type": "Кофейня",
      "Rating": "4.6"
    },
    {
      "title": "Музей советского быта",
      "coordinates": {
        "lat": "55.786851",
        "lon": "49.119465"
      },
      "type": "Музей",
      "Rating": "5.0"
    },
    {
      "title": "Шоколадница",
      "coordinates": {
        "lat": "55.785982",
        "lon": "49.119904"
      },
      "type": "Кофейня",
      "Rating": "4.1"
    }
  ]
};

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
                    Tab(text: data["places"][0]["title"]),
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
