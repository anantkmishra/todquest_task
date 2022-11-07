import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {

  TextEditingController searchController = TextEditingController();

  List<Map<String,dynamic>> userList = [];
  
  @override
  Widget build(BuildContext context) {

    // getUsersList();
    List<String> namesEmails = [];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Logged In Users"),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(namesEmails)
                );
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            future: FirebaseFirestore.instance.collection('Users').get(),
            builder: (context, snapshot ){
              if (snapshot.hasData){
                return ListView(
                  shrinkWrap: true,
                  children: List.generate(snapshot.data!.size, (index) {
                    namesEmails.add(snapshot.data!.docs[index]['name']);
                    namesEmails.add(snapshot.data!.docs[index].id);

                    return ListTile(
                      shape: const StadiumBorder(side: BorderSide(color: Colors.black, style: BorderStyle.solid)),
                      title: Text("NAME: ${snapshot.data!.docs[index]['name']}"),
                      subtitle: Text("EMAIL: ${snapshot.data!.docs[index].id}"),
                      trailing: Text("VIA ${snapshot.data!.docs[index]['platform']}"),
                    );
                  })
                );
              }else if (snapshot.hasError){
                return Text(snapshot.error.toString());
              }else{
                return const CircularProgressIndicator();
              }
            }),
        ),

      ),
    );
  }

  // getUsersList() async{
  //   await FirebaseFirestore.instance.collection('Users').get().then((value) {
  //     int i = 0;
  //     for (var element in value.docs) {
  //       userList.add(element.data());
  //       userList[i]!['email']= element.id;
  //     }
  //   });
  // }

}

class CustomSearchDelegate extends SearchDelegate {

  CustomSearchDelegate(this.searchTerms);

  List<String> searchTerms;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}