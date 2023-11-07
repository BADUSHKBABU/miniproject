//flutterlearning2023
//Add Notes is the collection name
//Title
//Note


import 'package:flutter/material.dart';
import 'package:notesavingapp/pageone.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notesavingapp/add.dart';
import 'package:notesavingapp/update.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/':(context)=>pageoone(),
        '/add':(context)=>addnotes(),
        '/update':(context)=>update()

      },
      initialRoute: '/',
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home:pageoone()


    );
  }
}
