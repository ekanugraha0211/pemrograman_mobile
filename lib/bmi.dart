import 'package:flutter/material.dart';

class BMICalculatorWidget extends StatefulWidget {
  const BMICalculatorWidget({Key? key}) : super(key: key);

  @override
  _BMICalculatorWidgetState createState() => _BMICalculatorWidgetState();
}

class _BMICalculatorWidgetState extends State<BMICalculatorWidget> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _result = 0;
  String _status = '';

  void _calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);
    double result = weight / (height * height);
    setState(() {
      _result = result;
      if (result < 18.5) {
        _status = 'Underweight';
      } else if (result >= 18.5 && result <= 24.9) {
        _status = 'Normal';
      } else if (result >= 25 && result <= 29.9) {
        _status = 'Overweight';
      } else {
        _status = 'Obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _heightController,
              decoration: const InputDecoration(
                labelText: 'Height (cm)',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _weightController,
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: const Text('Calculate'),
              style: ElevatedButton.styleFrom(
    backgroundColor: Colors.red,
            ),
            ),
            const SizedBox(height: 32),
            Text(
              'Result: ${_result.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Text(
              'Status: $_status',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
