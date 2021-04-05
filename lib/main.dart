import 'package:flutter/material.dart';

void main() => runApp(TipApp());

class TipApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip App',
      theme: ThemeData(primaryColor: Colors.purple),
      home: TipCalculator(),
    );
  }
}

class TipCalculator extends StatefulWidget {
  // This widget is the home screen of the Tip Calculator app. It is stateful, since we want
  // to keep track of the TipAmount & TotalAmount and update the UI accordingly
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  static const defaultBillAmount = 0.0;

  static const defaultTipPercentage = 15;

  final _billAmountController =
      TextEditingController(text: defaultBillAmount.toString());

  final _tipPercentageController =
      TextEditingController(text: defaultTipPercentage.toString());

  double _billAmount = defaultBillAmount;

  int _tipPercentage = defaultTipPercentage;

  @override
  void initState() {
    super.initState();
    _billAmountController.addListener(_onBillAmountChanged);
    _tipPercentageController.addListener(_onTipAmountChanged);
  }

  _onBillAmountChanged() {
    setState(() {
      _billAmount = double.tryParse(_billAmountController.text) ?? 0.0;
    });
  }

  _onTipAmountChanged() {
    setState(() {
      _tipPercentage = int.tryParse(_tipPercentageController.text) ?? 0;
    });
  }

  _getTipAmount() => _billAmount * _tipPercentage / 100;

  _getTotalAmount() => _billAmount + _getTipAmount();

  @override
  Widget build(BuildContext context) {
    // This method builds the UI of the Tip Calculator.
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Calculator!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  key: Key("billAmount"),
                  controller: _billAmountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: 'Enter the Bill Amount',
                    labelText: 'Bill Amount',
                  ),
                ),
                TextFormField(
                  key: Key("tipPercentage"),
                  controller: _tipPercentageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter the Tip %',
                    labelText: 'Tip %',
                  ),
                ),
                Text(
                  'Tip Amount: ${_getTipAmount()}',
                  key: Key('tipAmount'),
                ),
                Text(
                  'Total Amount: ${_getTotalAmount()}',
                  key: Key('totalAmount'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _billAmountController.dispose();
    _tipPercentageController.dispose();
    super.dispose();
  }
}
