import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {
  String appBarTitle = 'Task';
  BuildContext context;

  NoteDetails(context, this.appBarTitle);

  @override
  NoteDetailsState createState() => NoteDetailsState(context, this.appBarTitle);
}

class NoteDetailsState extends State<NoteDetails> {
  static var _priority = ['High', 'Low'];
  TextEditingController task = TextEditingController();
  TextEditingController shadule = TextEditingController();

  String appBarTitle;

  NoteDetailsState(context, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            // First element dropdown menu
            ListTile(
              title: DropdownButton(
                  items: _priority.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
//                style: textStyle,
                  value: 'Low',
                  onChanged: (valueSelectedByUser) {
                    setState(() {
                      debugPrint('User selected $valueSelectedByUser');
                    });
                  }),
            ),

            //second item
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: TextField(
                controller: task,
                style: TextStyle(color: Colors.black87),
                onChanged: (value) {
                  debugPrint('Adding task');
                },
                decoration: InputDecoration(
                  labelText: 'Task',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),

            // third element

            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: TextField(
                controller: shadule,
                style: TextStyle(color: Colors.black87),
                onChanged: (value) {
                  debugPrint('time task');
                },
                decoration: InputDecoration(
                  labelText: 'Date & Time',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),

            //forth element
            // Fourth Element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Save',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          debugPrint("Save button clicked");
                        });
                      },
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Delete',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          debugPrint("Delete button clicked");
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
