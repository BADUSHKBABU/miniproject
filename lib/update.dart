//Collection name is  Add Notes
//Title
//Note

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class update extends StatefulWidget {
  const update({super.key});

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {

  final TextEditingController title=TextEditingController();
  final TextEditingController note=TextEditingController();
  final CollectionReference database= FirebaseFirestore.instance.collection("Add Notes");

  @override
  Widget build(BuildContext context) {

    final arguments=ModalRoute.of(context)!.settings.arguments as Map;
    title.text=arguments["Title"];
    note.text=arguments["Notes"];
    final documentid=arguments["id"];



    return Scaffold(appBar: AppBar(title: Text("UPDATE NOTES"),),
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
          ElevatedButton(onPressed: (){updatebutton(documentid);}, child: Text("ADD"))
        ],
      ),);
  }

updatebutton(documentid)
{
  final data={"Note":note.text,"Title":title.text};
  database.doc(documentid).update(data);  //database => //Collectionreference database =Firebasefirestore.instance("")
}

}
