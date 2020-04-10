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
  String name = '';
  final _currencies = ['Dollars', 'Euro', 'Pounds'];
  String _currency = 'Dollars';
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
              decoration: InputDecoration(
                  hintText: 'e.g. 124',
                  labelText: 'Distance',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
              keyboardType: TextInputType.number,
              onChanged: (String string) {
                setState(() {
                  name = string;
                });
              },
            ),
            // DropdownButton<String>(
            //     items: _currencies.map((String value) {
            //       return DropdownMenuItem<String>(
            //           value: value, child: Text(value));
            //     }).toList(),
            //     value: _currency,
            //     onChanged: (String value) {
            //       _onDropdownChange(value);
            //     }),
            Text('Hello ' + name + '!'),
          ],
        ),
      ),
    );
  }

  _onDropdownChange(String value) {
    setState(() {
      this._currency = value;
    });
  }
}
