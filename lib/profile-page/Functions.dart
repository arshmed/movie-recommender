import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Functions {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map<String, bool> favourites = {};

  final currentUser = FirebaseAuth.instance.currentUser;

  Future<void> getitmeslogin() async {
    await firestore
        .collection("users")
        .where("email", isEqualTo: currentUser.email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var element in querySnapshot.docs) {
        favourites = Map.from(element["favourites"]);
      }
    });
  }

  Future<void> update(String email, String item) async {
    Map<String, bool> bookmark = {};

    await firestore
        .collection("users")
        .where("email", isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var element in querySnapshot.docs) {
        bookmark = Map.from(element["bookmarks"]);
        print(bookmark);
      }
    });

    for (var element in bookmark.keys) {
      if (element == item) {
        bookmark[item] = bookmark[item] ? false : true;
      }
    }

    await firestore
        .collection("users")
        .where("email", isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var element in querySnapshot.docs) {
        element.reference.update({"bookmarks": bookmark});
      }
    });

    await getitmeslogin();
  }
}
