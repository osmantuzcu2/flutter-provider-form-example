import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider_model.dart';
import 'result.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FormItems>.value(
      value: FormItems(),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  var name = TextEditingController();
  var lastname  = TextEditingController();
  var birthday  = TextEditingController();
  bool fav;
  DateTime birthdayDate;
  @override
  Widget build(BuildContext context) {
    final test = Provider.of<FormItems>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Example'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: 'Name'
              ),
            ),
            TextField(
              controller: lastname,
              decoration: InputDecoration(
                hintText: 'Lastname'
              ),
            ),

            TextField(
              controller: birthday,
              decoration: InputDecoration(
                hintText: 'Birthday'
              ),
              onTap: (){
                showModalBottomSheet(
                  builder: (BuildContext context) {
                    return CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (DateTime value) {
                        test.addBD(value);
                        birthday.text = value.toString().substring(0,10);
                      },
                      
                    );
                  }, 
                  context: context
                  
                );
              },
            ),

            Row(
              children: <Widget>[
                Text('Did you like?'),
                IconButton(
                  onPressed: (){
                    if(test.like==false)
                    test.fav(true);
                    else
                    test.fav(false);
                  },
                  icon: test.like==false?Icon(Icons.star_border,color:Colors.orange):
                  Icon(Icons.star,color:Colors.orange)
                  ,
                ),
              ],
            ),
            RaisedButton(
              onPressed: (){
                  test.addname(name.text);
                  test.addLastname(lastname.text);
                  Navigator.push(context, MaterialPageRoute(
                   builder: (context) => ResultWidget()
                  ));
              },
              child: Text('SEND'),
            )
          ],
        ),
      ),
      
    );
  }
}


