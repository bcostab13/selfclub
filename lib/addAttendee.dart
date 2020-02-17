import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddAttendee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Añadir asistente"),
        ),
        body: AddAttendeeForm());
  }
}

class AddAttendeeForm extends StatefulWidget {
  @override
  AddAttendeeFormState createState() {
    return AddAttendeeFormState();
  }
}

class AddAttendeeFormState extends State<AddAttendeeForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _dialogMembers(context);
              }
            },
            child: Text('Nuevo Asistente'),
          )
        ]));
  }
}

Widget optionTwo = SimpleDialogOption(
  child: const Text('cow'),
  onPressed: () {},
);
Widget optionThree = SimpleDialogOption(
  child: const Text('camel'),
  onPressed: () {},
);
Widget optionFour = SimpleDialogOption(
  child: const Text('sheep'),
  onPressed: () {},
);
Widget optionFive = SimpleDialogOption(
  child: const Text('goat'),
  onPressed: () {},
);

Future<void> _dialogMembers(BuildContext context) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return SimpleDialog(
            title: const Text('Choose an animal'),
            children: <Widget>[
              SimpleDialogOption(
                child: const Text('horse'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              optionTwo,
              optionThree,
              optionFour,
              optionFive,
            ]);
      });
}
