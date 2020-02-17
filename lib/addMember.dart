import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddMember extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Añadir miembro"),
        ),
        body: AddMemberForm());
  }
}

class AddMemberForm extends StatefulWidget {
  @override
  AddMemberFormState createState() {
    return AddMemberFormState();
  }
}

class AddMemberFormState extends State<AddMemberForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    final fnCnt = TextEditingController();
    final lnCnt = TextEditingController();
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextFormField(
              controller: fnCnt,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombres',
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextFormField(
                controller: lnCnt,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Apellidos',
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo obligatorio';
                  }
                  return null;
                }),
          ),
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text(fnCnt.text)));
                Firestore.instance.collection('gcarqmi').add({
                  "firstName": fnCnt.text,
                  "lastName": lnCnt.text,
                  "assistance":0
                });
                Navigator.pop(context);
              }
            },
            child: Text('Añadir'),
          )
        ]));
  }
}
