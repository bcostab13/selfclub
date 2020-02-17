import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:selfclub/model/event.dart';
import 'addAttendee.dart';

class ListEventPage extends StatefulWidget {
  @override
  _ListEventPageState createState() {
    return _ListEventPageState();
  }
}

class _ListEventPageState extends State<ListEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Eventos')),
      body: _buildBodyListEvent(context),
    );
  }
}

Widget _buildBodyListEvent(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance
        .collection('/groups/LEPNrQAHSbpT8HyHmjcU/events')
        .snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return LinearProgressIndicator();

      return _buildListEvent(context, snapshot.data.documents);
    },
  );
}

Widget _buildListEvent(BuildContext context, List<DocumentSnapshot> snapshot) {
  return ListView(
    padding: const EdgeInsets.only(top: 20.0),
    children:
        snapshot.map((data) => _buildListEventItem(context, data)).toList(),
  );
}

Widget _buildListEventItem(BuildContext context, DocumentSnapshot data) {
  final event = Event.fromSnapshot(data);

  return Padding(
      key: ValueKey(event.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
            title: Text(event.name),
            leading: Icon(Icons.today),
            onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddAttendee()),
                  )
                }),
      ));
}
