import 'package:flutter/material.dart';

class DiscountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _getDiscountScreen(context);
  }

  Widget _getDiscountScreen(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 100.0),
            child: Text("Вы получили скидочный купон",
                style: Theme.of(context).textTheme.headline),
          ),
      Container(
        padding: EdgeInsets.only(top: 30.0),
        child: Text("10%",
              style: Theme.of(context)
                  .textTheme
                  .display3
                  .copyWith(color: Colors.deepPurple))),
      Container(
        padding: EdgeInsets.only(top: 15.0),
        child: Text("ID-YUI-36471", style: Theme.of(context).textTheme.body1)
      ),
      Container(
        padding: EdgeInsets.only(top: 30.0),
        child: Text('Купон действителен в кальянной “Наше место"',
              style: Theme.of(context).textTheme.body1)),
          Container(
            margin: EdgeInsets.only(top: 30.0),
            padding: EdgeInsets.all(15.0),
            width: 250.0,
            decoration: BoxDecoration (
              borderRadius: new BorderRadius.circular(25.0),
              color: Colors.deepPurple,
            ),
            child: Center(
              child: Container(
                child: InkWell(
                  child: Text("ПАСЕБА", style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.white)),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
