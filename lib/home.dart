import 'package:flutter/material.dart';

import 'note_detail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App'),
      ),
      body: getListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Fab Clicked');
          navigateToDetail(context, 'Add Note');
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        tooltip: 'Add Note',
      ),
    );
  }


}

ListView getListView() {
  var count;
  return ListView.builder(
    itemCount: count,
    itemBuilder: (BuildContext context, int index) {
      return Card(
        color: Colors.white,
        elevation: 2.0,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.amber,
            child: Icon(Icons.keyboard_arrow_right, color: Colors.white,),
          ),
          title: Text(
            'Dummy Title',
            style: TextStyle(),
          ),
          subtitle: Text(
            'Dummy Title',
            style: TextStyle(),
          ),
          trailing: Icon(
            Icons.delete,
            color: Colors.grey,
          ),
          onTap: () {
            debugPrint('List item selected');
            var lol = 'Edit Note';
            navigateToDetail(context, lol);
          },
        ),
      );
    },
  );
}

navigateToDetail(context, String title) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return NoteDetails(context, title);
  }));
}
