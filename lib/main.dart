import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ArithmeticOperationsScreen(),
    );
  }
}

class ArithmeticOperationsScreen extends StatefulWidget {
  @override
  _ArithmeticOperationsScreenState createState() =>
      _ArithmeticOperationsScreenState();
}

class _ArithmeticOperationsScreenState
    extends State<ArithmeticOperationsScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _operation = 'Suma';
  String _result = '';

  void _calculate() {
    double num1 = double.tryParse(_controller1.text) ?? 0;
    double num2 = double.tryParse(_controller2.text) ?? 0;
    double result;

    switch (_operation) {
      case 'Suma':
        result = num1 + num2;
        break;
      case 'Resta':
        result = num1 - num2;
        break;
      case 'Multiplicación':
        result = num1 * num2;
        break;
      case 'División':
        result = num2 != 0 ? num1 / num2 : 0;
        break;
      default:
        result = 0;
    }

    setState(() {
      _result = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operaciones Aritméticas'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Ingrese un número',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Ingrese un número también',
              ),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: _operation,
              onChanged: (String? newValue) {
                setState(() {
                  _operation = newValue!;
                });
              },
              items: <String>['Suma', 'Resta', 'Multiplicación', 'División']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: _result,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _calculate,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
