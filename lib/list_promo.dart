import 'package:flutter/material.dart';

class ListPromo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
        child: Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.25,
          padding: EdgeInsets.symmetric(vertical: 15.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepPurple, width: 1.0)
            ),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text("НАШЕ МЕСТО", style: Theme.of(context).textTheme.headline),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text("10%", style: Theme.of(context).textTheme.display2.copyWith(color: Colors.deepPurple)),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text("098-TY-UOIT", style: Theme.of(context).textTheme.body1),
              )
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (ctx, index) {
              return _getListItem(
                  "Наше место", "Использован 5 раз", "15%", ctx);
            })
      ],
    ));
  }

  Widget _getListItem(
      String primaryText, secondaryText, discount, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.black12, width: 1.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(primaryText, style: Theme.of(context).textTheme.body1),
              Text(secondaryText, style: Theme.of(context).textTheme.caption),
            ],
          ),
          Text(discount,
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(color: Colors.deepPurple))
        ],
      ),
    );
  }
}
