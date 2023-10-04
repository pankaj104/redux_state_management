import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_state_management/voting_redux.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redux State Management'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 150,),
            Text('Enter your age:', style: TextStyle(fontSize: 18),),
            SizedBox(height: 10),
            Container(
              width: 120,
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  final newAge = int.tryParse(value) ?? 0;
                  StoreProvider.of<int>(context).dispatch(UpdateAgeAction(newAge));
                },
              ),
            ),
            SizedBox(height: 20),
            StoreConnector<int, bool>(
              converter: (Store<int> store) {
                final age = store.state;
                return age >= 18;
              },
              builder: (context, isEligible) {
                return Text(
                  isEligible
                      ? 'You are eligible to vote! 😊'
                      : 'You are not eligible to vote.😒',
                  style: isEligible ?
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green):
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
