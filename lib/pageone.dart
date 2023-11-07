//Collection name is  Add Notes
//Title
//Note


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notesavingapp/add.dart';

class pageoone extends StatefulWidget {
  const pageoone({super.key});

  @override
  State<pageoone> createState() => _pageooneState();
}

class _pageooneState extends State<pageoone> {

  final CollectionReference notes=FirebaseFirestore.instance.collection("Add Notes");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Note Saving App"),backgroundColor: Colors.green,),

      floatingActionButton: FloatingActionButton.small(onPressed: (){setState(() {
        addbutton();
      });},child: Icon(Icons.add),),

      body: StreamBuilder(
        stream: notes.snapshots(),
        builder: (context,snapshot){
          if (snapshot.hasData)
            {
              return ListView.builder(
                  itemCount:snapshot.data!.docs.length,
                  itemBuilder: (context,index){
                    final DocumentSnapshot documentSnapshot=snapshot.data!.docs[index];
                    ElevatedButton(onPressed: (){addbutton();}, child: Icon(Icons.add));
                    return Container(color: Colors.grey,
                      child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //TextButton(onPressed: (){}, child: Text( documentSnapshot["Title"],style: TextStyle(fontSize: 30,color: Colors.white,)),)
                          Container(child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(child: Text( documentSnapshot["Title"],style: TextStyle(fontSize: 30,color: Colors.white,))),
                              IconButton(onPressed: (){
                                Navigator.pushNamed(context, '/update',arguments: {"Title":documentSnapshot['Title'],"id":documentSnapshot.id,"Note":documentSnapshot['Note']});
                              }, icon: Icon(Icons.edit,size: 30,color: Colors.blue,)),
                            ],
                          )
                          ),

                          //Text(documentSnapshot["Note"],style: TextStyle(fontSize: 20,color: Colors.blue)),


                        ],
                      ),
                    );
                  });
            }
          return CircularProgressIndicator();
        },
      ),
    );
  }

//TO ADD NOTES TO DB
  addbutton()
  {
    Navigator.of(context).push(MaterialPageRoute(builder: (context){return addnotes();}));
  }
  }
