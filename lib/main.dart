import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(DiceApp());
}

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dual Dice Roller',
      theme: ThemeData(primarySwatch: Colors.green),
      home: DiceHomePage(),
    );
  }
}

class DiceHomePage extends StatefulWidget {
  @override
  _DiceHomePageState createState() => _DiceHomePageState();
}

class _DiceHomePageState extends State<DiceHomePage> {
  final Random _random = Random();
  int _diceValue1 = 1;
  int _diceValue2 = 1;
  int _rollCount = 0;
  int _totalValue = 0;

  void _rollDice() {
    setState(() {
      _diceValue1 = _random.nextInt(6) + 1; // First dice roll between 1 and 6
      _diceValue2 = _random.nextInt(6) + 1; // Second dice roll between 1 and 6
      _rollCount += 1;
      _totalValue += (_diceValue1 + _diceValue2); // Sum of both dice values
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text('Dual Dice Roller')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dice Values: $_diceValue1 & $_diceValue2',
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 20),
            // Row to display two dice images side by side
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // First dice display with animation
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  child: Image.asset(
                    'images/dice$_diceValue1.png',
                    key: ValueKey<int>(_diceValue1),
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(width: 20),
                // Second dice display with animation
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  child: Image.asset(
                    'images/dice$_diceValue2.png',
                    key: ValueKey<int>(_diceValue2),
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _rollDice,
              child: Text('Roll Dice'),
            ),
            SizedBox(height: 20),
            Text(
              'Roll Count: $_rollCount',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Total Value: $_totalValue',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
