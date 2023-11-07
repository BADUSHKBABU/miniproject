//Collection name is  Add Notes
//Title
//Note

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
 class addnotes extends StatefulWidget {
   const addnotes({super.key});

   @override
   State<addnotes> createState() => _addnotesState();
 }

 class _addnotesState extends State<addnotes> {

   final TextEditingController title=TextEditingController();
   final TextEditingController note=TextEditingController();

   final CollectionReference database= FirebaseFirestore.instance.collection("Add Notes");

   @override
   Widget build(BuildContext context) {



     return Scaffold(appBar: AppBar(title: Text("ADD NOTES"),),
     body: Column(
       children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextFormField(
             controller: title,
             decoration: InputDecoration(hintText: "Title",
             border: OutlineInputBorder()),
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextFormField(
             controller: note,
             decoration: InputDecoration(hintText: "Note",
                 border: OutlineInputBorder(),
             ),
           ),
         ),
         ElevatedButton(onPressed: (){addToDatabase();}, child: Text("ADD"))
       ],
     ),);
   }


   Future addToDatabase() async
   {
     final data={"Title":title.text,"Note":note.text};
     database.add(data);//Collectionreference database =Firebasefirestore.instance("")
   }
 }
