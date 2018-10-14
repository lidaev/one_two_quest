import 'package:flutter/material.dart';

class ModalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(child: _getModalScreen(context)));
  }

  Widget _getModalScreen(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .8,
      height: size.height * .6,
      color: Colors.white,
      child: Center(
        child: SimpleDialogOption(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                  "Вы собираетесь оставить купон на 10% в “Наше место”. ",
                  style: Theme.of(context).textTheme.body1),
            ),
            Container(
                padding: EdgeInsets.only(top: 15.0),
                child: Text("Что мне это даст?",
                    style: Theme.of(context)
                        .textTheme
                        .body2
                        .copyWith(color: Colors.deepPurple))),
            Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                    "За каждое пятое использование Вашего купона Вы получаете скидку в этом месте. ",
                    style: Theme.of(context).textTheme.body1)),
            Container(
                padding: EdgeInsets.only(top: 15.0),
                child: Text("Как узнать статус оставленных купонов?",
                    style: Theme.of(context)
                        .textTheme
                        .body2
                        .copyWith(color: Colors.deepPurple))),
            Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                    "Вы можете следить за использованными купонами в разделе “Мои Купоны”.",
                    style: Theme.of(context).textTheme.body1)),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              padding: EdgeInsets.all(15.0),
              width: 250.0,
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(25.0),
                color: Colors.deepPurple,
              ),
              child: Center(
                child: Container(
                  child: InkWell(
                    child: Text("Поделиться купоном",
                        style: Theme.of(context)
                            .textTheme
                            .subhead
                            .copyWith(color: Colors.white)),
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
