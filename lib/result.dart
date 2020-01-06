import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_model.dart';

class ResultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final test = Provider.of<FormItems>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(test.name),
            Text(test.lastName),
            Text(test.birthDay.toString()),
            test.like == true
                ? Icon(
                    Icons.star,
                    color: Colors.orange,
                  )
                : Icon(Icons.star_border, color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
