import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double bill = 0;
  double tipPercentage = 15;
  double tipAmount = 0;
  double totalAmount = 0;

  void tipCal() {
    tipAmount = bill * tipPercentage * 0.01;
    totalAmount = bill + tipAmount;
    print(tipAmount);
    print(totalAmount);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: "Enter bill amount"),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  print(value);
                  value != "" ? bill = double.parse(value) : bill = 0.0;
                },
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Enter tip percentage"),
                onChanged: (value) {
                  print(value);
                  setState(() {
                    value != null
                        ? tipPercentage = double.parse(value)
                        : tipPercentage = 0.0;
                  });
                },
              ),
              Row(
                children: [
                  Text("Tip Amount"),
                  Spacer(),
                  Text("$tipAmount"),
                ],
              ),
              Row(
                children: [
                  Text("Total Amount"),
                  Spacer(),
                  Text("$totalAmount"),
                ],
              ),
              RaisedButton(
                onPressed: () {
                  tipCal();
                },
                child: Text("Calculate tip"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
