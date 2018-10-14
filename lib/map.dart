import 'dart:async';


import 'package:latlong/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class PlaceMapScreen extends StatefulWidget {
  final List<Object> _coworkings;

  PlaceMapScreen(this._coworkings){}
//    _coworkings = (coworkings ?? []).where((cw)=> cw.lat != null && cw.lng != null).();

  @override
  State<StatefulWidget> createState() => _PlaceMapScreenState();
}

class _PlaceMapScreenState extends State<PlaceMapScreen> {

  static const String _mapBoxUrl = "https://api.mapbox.com/v4/{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}";
  static const String _mapBoxToken = "pk.eyJ1Ijoidm92YW4xMjMiLCJhIjoiY2o3aXNicTFhMW9jbDJxbWw3bHNqMW92MCJ9.N1hCLnBrJjdX0JmYuA8bOw";
  static const String _mapBoxId = "mapbox.streets";

  MapController _mapController = MapController();
  GlobalKey _scaffoldState = GlobalKey<ScaffoldState>();
  Size _screenSize ;
  LatLng _lastPos;
  double _screenHeight, _screenWidth;
  bool _cardShowing = false;
  Object _coworking;
  LatLng _deaultPos = LatLng(49.1333333, 55.75);

  @override
  void initState(){
    super.initState();


    _mapController.onReady.then(
            (ready){}
    );
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    _screenHeight = _screenSize.height;
    _screenWidth = _screenSize.width;
    return Scaffold(
      key: _scaffoldState,
      body: _buildCoWorkingMap(),
    );
  }

  Widget _buildCoWorkingMap(){
    return Container(
      child: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              child: FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                      zoom: 3.0,
                      onTap: (pos){
                        setState(() {
                          _cardShowing = false;
                          _coworking = null;
                        });
                      },
                      onPositionChanged: (pos){
                        if (_cardShowing){
                          setState(() {
                            _cardShowing = false;
                            _coworking = null;
                          });
                        }
                      }
                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate: _mapBoxUrl,
                      additionalOptions: {
                        'accessToken': _mapBoxToken,
                        'id': _mapBoxId,
                      },
                    ),
                    MarkerLayerOptions(
                        markers: List.generate(widget._coworkings.length,
                                (ind){
                              var cw = widget._coworkings[ind];
                              return Marker(
                                  point: LatLng(_deaultPos.latitude, _deaultPos.longitude),
//                                  point: LatLng(cw.lat, cw.lng),
                                  builder: (ctx) =>  GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          _mapController.move(LatLng(_deaultPos.latitude, _deaultPos.latitude), _mapController.zoom);
//                                          _mapController.move(LatLng(cw.lat, cw.lng), _mapController.zoom);
                                          _cardShowing = true;
                                          _coworking = cw;
                                        });
                                      },
                                      child: Container(
                                        width: 70.0,
                                        height: 70.0,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.fitHeight,
                                            image: AssetImage('assets/pin_orange.png'),
                                          ),
                                        ),
                                      )
                                  )
                              );
                            }
                        )..add(
                            _buildUserMarker()
                        )
                    )
                  ]
              )
          ),
          Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 5.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 35.0,
                        height: 35.0,
                        decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(170, 255, 255, 255),
                        ),
                        child: IconButton(
                          iconSize: 20.0,
                          icon: Icon(Icons.zoom_in),
                          color: Color.fromARGB(160, 0, 0, 0),
                          onPressed: () {
                            setState(() {
                              _mapController.move(_mapController.center, _mapController.zoom + 0.5);
                            });
                          },
                        )
                    ),
                    Padding(padding: EdgeInsets.only(top: 7.0)),
                    Container(
                        width: 35.0,
                        height: 35.0,
                        decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(170, 255, 255, 255),
                        ),
                        child: IconButton(
                          iconSize: 20.0,
                          icon: Icon(Icons.zoom_out),
                          color: Color.fromARGB(160, 0, 0, 0),
                          onPressed: () {
                            setState(() {
                              _mapController.move(_mapController.center, _mapController.zoom - 0.5);
                            });
                          },
                        )
                    ),
                    Padding(padding: EdgeInsets.only(top: 7.0)),
                    Container(
                        width: 35.0,
                        height: 35.0,
                        decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(170, 255, 255, 255),
                        ),
                        child: IconButton(
                          iconSize: 20.0,
                          icon: Icon(Icons.center_focus_strong),
                          color: Color.fromARGB(160, 0, 0, 0),
                          onPressed: () {
                            if (_deaultPos != null){
                              setState(() {
                                _lastPos = LatLng(_deaultPos.latitude, _deaultPos.longitude);
                                _mapController.move(_lastPos, _mapController.zoom);
                              });
                            }
                          },
                        )
                    ),
                  ]
              )
          ),
          _getCoWorkingCard()
        ],
      ),
    );
  }

  Widget _getCoWorkingCard(){
    if (_cardShowing){
      return GestureDetector(
          onTap: (){
            _openDetails(_coworking);
          },
          child: Container(
              alignment: Alignment.center,
              height: _screenHeight,
              child: Container(
                margin: EdgeInsets.only(bottom: _screenHeight * 0.2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(6.0))
                ),
                width: _screenWidth * 0.7,
                height: _screenHeight * 0.11,
                child: Container(
                  child: Container(
                      margin: EdgeInsets.only(left: 7.0, right: 7.0, top: 7.0, bottom: 7.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: _screenWidth * 0.45,
                            child: Text(""  ?? "",
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0
                              ),
                            ),
                          ),
                          Container(
                            width: _screenWidth * 0.45,
                            child: Text(" " ?? "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13.0
                              ),
                            ),
                          ),
                          Text(" " != null ? " " + " - " + " " : "Closed",
                            style: TextStyle(
                                color: " " != null ? Colors.green.withAlpha(180) : Colors.red.withAlpha(180),
                                fontWeight: FontWeight.w300,
                                fontSize: 14.0
                            ),
                          )
                        ],
                      )
                  ),
                ),
              )
          )
      );
    } else {
      return Container();
    }
  }

  Marker _buildUserMarker(){
    if (_lastPos != null){
      return Marker(
          width: 15.0,
          height: 15.0,
          point: _lastPos,
          builder: (ctx) =>
              Container(
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.withAlpha(200)
                  )
              )
      );
    } else {
      return Marker(point: LatLng(59.1, 49.1), builder: (ctx) => Container());
    }
  }

  Widget _showMessage(String message){
    return Center(child: Text(message),);
  }

  _openDetails(Object coWorking){
//    SharedPreferences.getInstance().then((sp){
//      String token = sp.getString(ConstantsManager.TOKEN_KEY);
//      Navigator.push(
//          context,
//          MaterialPageRoute(
//              builder: (context)=>CoWorkingDetailsScreen(coWorking, token)));
//    });

  }
}
