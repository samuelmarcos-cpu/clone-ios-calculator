import 'package:flutter/material.dart';
import 'package:calc_mac/models/calculator.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CalcPackTile extends StatelessWidget {
  CalcPackTile({Key key, this.calcPack}) : super(key: key);

  final CalculatorData calcPack;

  @override
  Widget build(BuildContext context) => Container(
        color: Color.fromRGBO(0, 0, 0, 0.4),
        child: ListTile(
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                      calcPack.equation
                          .substring(0, calcPack.equation.length - 2),
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .body1
                          .apply(color: Colors.white, fontSizeDelta: -5)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('= ' + calcPack.displayA,
                    textAlign: TextAlign.right,
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .apply(color: Colors.white, fontWeightDelta: 5)),
              ],
            ),
            onTap: () {
              Provider.of<CalculatorModel>(context).load(calcPack);
              Navigator.pop(context);
            }),
      );
}

class CalculatorHistory extends StatelessWidget {
  final List<CalculatorData> history;

  CalculatorHistory({Key key, this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int itemCount;
    var itemBuilder;

    if (history.isEmpty) {
      itemCount = 1;
      itemBuilder = (context, index) => Padding(
            padding: EdgeInsets.all(25),
            child: Text(
              'Ainda não há histórico',
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.body1.apply(color: Colors.white),
            ),
          );
    } else {
      itemCount = history.length;
      itemBuilder = (context, index) => CalcPackTile(
            calcPack: history[(history.length - 1) - index],
          );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History",
          textAlign: TextAlign.right,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(83, 105, 118, 1.0),
              Color.fromRGBO(41, 46, 73, 1.0),
            ],
          ),
        ),
        child: ListView.separated(
          separatorBuilder: (context, index) => Container(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            child: Divider(
              color: Colors.white,
              indent: 25,
              endIndent: 25,
            ),
          ),
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        ),
      ),
    );
  }
}
