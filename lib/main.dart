import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:one_two_quest/discount-page.dart';
import 'package:one_two_quest/list_promo.dart';
import 'package:one_two_quest/map.dart';
import 'package:one_two_quest/place.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  List places = [
    {
      "title": "Окинава",
      "coordinates": {"lat": "55.788410", "lon": "49.121562"},
      "type": "Ресторан",
      "discount": "10",
      "Rating": "4.5"
    },
    {
      "title": "Нефть",
      "coordinates": {"lat": "55.787861", "lon": "49.120184"},
      "type": "Кофейня",
      "discount": "8",
      "Rating": "4.6"
    },
    {
      "title": "Музей СССР",
      "coordinates": {"lat": "55.786851", "lon": "49.119465"},
      "type": "Музей",
      "discount": "5",
      "Rating": "5.0"
    },
    {
      "title": "Шоколадница",
      "coordinates": {"lat": "55.785982", "lon": "49.119904"},
      "type": "Кофейня",
      "discount": "10",
      "Rating": "4.1"
    }
  ];

  @override
  Widget build(BuildContext context) {
    List<Place> places = [];
    this.places.forEach((d) {
      String name = d['title'];
      String type = d['type'];
      double rating = double.parse(d['Rating']);
      int discount = int.parse(d['discount']);
      double lat = double.parse(d['coordinates']['lat']);
      double lng = double.parse(d['coordinates']['lon']);
      LatLng latLng = LatLng(lat, lng);
      Place p = Place(name, latLng, type, rating, discount);
      places.add(p);
    });
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  bottom: TabBar(
                    indicatorColor: Colors.deepPurple,
                    tabs: [
                      Tab(text: "КАРТА"),
                      Tab(text: "МОИ КУПОНЫ"),
                    ],
                  ),
                  title: Text('OneTwoQuest'),
                  centerTitle: true,
                ),
                body: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                  PlaceMapScreen(places),
                  ListPromo(),
                ]))));
  }
}
