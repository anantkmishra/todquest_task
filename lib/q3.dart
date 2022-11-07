import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:q23/q3users.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final GlobalKey<FormState> userLoginForm = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  String platform = 'Google';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Details"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: userLoginForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  controller: username,
                  onFieldSubmitted: (value) {
                    setState(() {
                      username.text = value.toString();
                    });
                  },
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.person_outline_rounded,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.blue,
                    hintText: "Name",
                    labelText: 'Name',
                  ),
                  validator: (value){
                    if (value == null || value == ''){
                      return 'Name cannot be empty.';
                    }
                    else if (value.contains(RegExp(r'[0-9]'))){
                      return 'Name cannot have digits.';
                    }
                    else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(height: 50),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  controller: email,
                  onFieldSubmitted: (value) {
                    setState(() {
                      email.text = value.toString();
                    });
                  },
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.green,
                    hintText: "Email",
                    labelText: 'Email',
                  ),
                  validator: (value){
                    if (value == null || value == ''){
                      return 'Email cannot be empty.';
                    }
                    else if (!value.contains('@') || !value.contains('.') || value.length < 6){
                      return 'Invalid Email-ID.';
                    }
                    else if(value.contains(' ')){
                      return 'Email can not have space';
                    }
                    else{
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(height: 50,),

              // SizedBox(),
              const Text("Please Select Your Platform"),

              DropdownButton<String>(
                focusColor:Colors.blue,
                value: platform,
                style: const TextStyle(color: Colors.white),
                iconEnabledColor:Colors.black,
                items: <String>[
                  'Facebook',
                  'Instagram',
                  'Organic',
                  'Friend',
                  'Google',
                  ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,style:const TextStyle(color:Colors.black),),
                  );
                }).toList(),
                hint: const Text(
                  "Please select a Platform",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                onChanged: (String? value) {
                  setState(() {
                    platform = value??"Google" ;
                  });
                },
              ),

              TextButton(
                onPressed: (){
                  if(validateForm()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Users()));
                  }
                },
                style: TextButton.styleFrom(side: const BorderSide(color: Colors.blue, width: 2)),
                child: const Text("Login"),
              ),

            ],
          ),
        ),
      ),
    );
  }

  bool validateForm(){
    if (userLoginForm.currentState!.validate()){
      userLoginForm.currentState!.save();
      userLogin(username.text, email.text, platform);
      return true;
    }
    return false;
  }

  Future userLogin(name, email, platform) async{

    final docUser = FirebaseFirestore.instance.collection('Users').doc(email);

    final userData = {'name':name, 'platform':platform, 'loggedin': true};

    await docUser.set(userData);

  }
}
