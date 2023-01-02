import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moviee/auth/read%20data/get_user_name.dart';

class HomePageLogin extends StatefulWidget {
  const HomePageLogin({Key key}) : super(key: key);

  @override
  State<HomePageLogin> createState() => _HomePageLoginState();
}

class _HomePageLoginState extends State<HomePageLogin> {
  final currentuser = FirebaseAuth.instance.currentUser;

  // doc ID's
  List<String> docID = [];

  // method getting docIds
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('users')
        .where("email", isEqualTo: currentuser.email)
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              //print(document.reference);
              docID.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentuser.email),
        actions: [
          GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: Icon(Icons.logout))
        ],
      ),
      body: Center(
          child: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getDocId(),
            builder: (context, snapshot) {
              return ListView.builder(
                  itemCount: docID.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        tileColor: Colors.deepOrange,
                        title: GetUserName(docID[index]),
                      ),
                    );
                  });
            },
          ))
        ],
      )),
    );
  }
}
