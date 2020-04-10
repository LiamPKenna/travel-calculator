import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FuelForm(),
    );
  }
}

class FuelForm extends StatefulWidget {
  @override
  _FuelFormState createState() => _FuelFormState();
}

class _FuelFormState extends State<FuelForm> {
  String result = '';
  final _currencies = ['Dollars', 'Euro', 'Pounds'];
  String _currency = 'Dollars';
  final double _formDistance = 5.0;
  TextEditingController distanceController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController perUnitController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
                padding:
                    EdgeInsets.only(top: _formDistance, bottom: _formDistance),
                child: TextField(
                  controller: distanceController,
                  decoration: InputDecoration(
                      hintText: 'e.g. 124',
                      labelText: 'Distance',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                  keyboardType: TextInputType.number,
                )),
            Padding(
                padding:
                    EdgeInsets.only(top: _formDistance, bottom: _formDistance),
                child: TextField(
                  controller: perUnitController,
                  decoration: InputDecoration(
                      hintText: 'e.g. 17',
                      labelText: 'Distance per Unit',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                  keyboardType: TextInputType.number,
                )),
            Padding(
                padding:
                    EdgeInsets.only(top: _formDistance, bottom: _formDistance),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      controller: priceController,
                      decoration: InputDecoration(
                          hintText: 'e.g. 3.50',
                          labelText: 'Price',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                      keyboardType: TextInputType.number,
                    )),
                    Container(
                      width: _formDistance * 5,
                    ),
                    Expanded(
                        child: DropdownButton<String>(
                            items: _currencies.map((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: Text(value));
                            }).toList(),
                            value: _currency,
                            onChanged: (String value) {
                              _onDropdownChange(value);
                            }))
                  ],
                )),
            Row(children: <Widget>[
              Expanded(
                child: RaisedButton(
                    color: Theme.of(context).primaryColorDark,
                    textColor: Theme.of(context).primaryColorLight,
                    onPressed: _submit,
                    child: Text(
                      'Submit',
                      textScaleFactor: 1.5,
                    )),
              ),
              Container(
                width: _formDistance,
              ),
              Expanded(
                child: RaisedButton(
                    color: Theme.of(context).buttonColor,
                    textColor: Theme.of(context).primaryColorDark,
                    onPressed: _reset,
                    child: Text(
                      'Reset',
                      textScaleFactor: 1.5,
                    )),
              )
            ]),
            Text(result),
          ],
        ),
      ),
    );
  }

  void _onDropdownChange(String value) {
    setState(() {
      this._currency = value;
    });
  }

  double _calculate() {
    double _distance = double.parse(this.distanceController.text);
    double _price = double.parse(this.priceController.text);
    double _perUnit = double.parse(this.perUnitController.text);
    return _distance / _perUnit * _price;
  }

  void _reset() {
    distanceController.text = '';
    perUnitController.text = '';
    priceController.text = '';
    setState(() {
      result = "";
    });
  }

  void _submit() {
    setState(() {
      result = "Your trip will cost " +
          _calculate().toStringAsFixed(2) +
          ' ' +
          _currency;
    });
  }
}
