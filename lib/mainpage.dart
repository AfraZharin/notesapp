import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp/noteditor.dart';
import 'package:notesapp/widgets/appstyle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp/widgets/notcard.dart';
import 'package:notesapp/notereaderstate.dart';

class Nots extends StatefulWidget {
  const Nots({Key? key}) : super(key: key);

  @override
  State<Nots> createState() => _NotsState();
}

class _NotsState extends State<Nots> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        centerTitle: true,
        backgroundColor:appStyle.maicolor ,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Your recent Notes",style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),),
          SizedBox(height: 30,),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("notes").snapshots(),
              builder: (context,AsyncSnapshot snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(snapshot.hasData){
                  return GridView(
                      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,),
                    children: snapshot.data.docs.map<Widget>((note)=>noteCard(() =>{
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Notreader(note)))


                    },note )).toList(),

                  );

                }
                return Text("there is no notes",
                style: GoogleFonts.nunito(
                  color: Colors.white,
                ),);
              },
            ),
          )

      ],),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Notedtr()));
          }, label:
      Text("Add note"),
      icon: Icon(Icons.add),),
    );
  }
}
