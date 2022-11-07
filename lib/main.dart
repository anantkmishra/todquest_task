import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:q23/q2.dart';
import 'package:q23/q3.dart';
import 'package:q23/q3users.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const Q2UI()));
            },
            style: TextButton.styleFrom(backgroundColor: Colors.white),
            child: const Text("Answer to Question 2"),

          ),
          const Divider(color: Colors.white,),
          TextButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const Login()));
            },
            style: TextButton.styleFrom(backgroundColor: Colors.white),
            child: const Text("Answer to Question 3"),
          ),
          TextButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const Users()));
            },
            style: TextButton.styleFrom(backgroundColor: Colors.white),
            child: const Text("Logged-In User List"),
          ),
        ],
      ),
    );
  }
}
