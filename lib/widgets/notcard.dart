import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/widgets/appstyle.dart';


Widget noteCard(Function()? onTap,QueryDocumentSnapshot doc){
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: appStyle.cardsColor[doc["color_id"]],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(doc["note_title"],
          style: appStyle.mainTitle,),
          SizedBox(height: 4,),
          Text(doc["creation_date"],
          style: appStyle.dateTitle,
          ),
          SizedBox(height: 8,),
          Text(doc['note_content'],
          style: appStyle.mainContent,),

        ],
      ),
    ),
  );
}