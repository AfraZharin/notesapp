import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notesapp/widgets/appstyle.dart';



class Notreader extends StatefulWidget {
     Notreader(this.doc,{Key? key}) : super(key: key);

  QueryDocumentSnapshot doc;

  @override
  State<Notreader> createState() => _NotreaderState();
}

class _NotreaderState extends State<Notreader> {
  @override
  Widget build(BuildContext context) {
    int color_id=widget.doc['color_id'];
    return Scaffold(
      backgroundColor: appStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: appStyle.cardsColor[color_id],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
            widget.doc["note_title"],
            style: appStyle.mainTitle,
          ),
            SizedBox(height: 10,),
            Text(
              widget.doc["creation_date"],
              style: appStyle.dateTitle,
            ),
            SizedBox(height: 8,),
            Text(
              widget.doc["note_content"],
              style: appStyle.mainContent,
            ),
        ],),
      ),
    );
  }
}
