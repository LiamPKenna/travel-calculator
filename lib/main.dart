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
            TextField(
              controller: distanceController,
              decoration: InputDecoration(
                  hintText: 'e.g. 124',
                  labelText: 'Distance',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: perUnitController,
              decoration: InputDecoration(
                  hintText: 'e.g. 17',
                  labelText: 'Distance per Unit',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                  hintText: 'e.g. 3.50',
                  labelText: 'Price',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
              keyboardType: TextInputType.number,
            ),
            DropdownButton<String>(
                items: _currencies.map((String value) {
                  return DropdownMenuItem<String>(
                      value: value, child: Text(value));
                }).toList(),
                value: _currency,
                onChanged: (String value) {
                  _onDropdownChange(value);
                }),
            RaisedButton(
                color: Theme.of(context).primaryColorDark,
                textColor: Theme.of(context).primaryColorLight,
                onPressed: () {
                  setState(() {
                    result = "Your trip will cost " +
                        _calculate().toStringAsFixed(2) +
                        ' ' +
                        _currency;
                  });
                },
                child: Text(
                  'Submit',
                  textScaleFactor: 1.5,
                )),
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
}
