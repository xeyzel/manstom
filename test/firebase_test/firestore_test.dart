import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inventory_app/data/model/user/user.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

void main() {
  final instance = FakeFirebaseFirestore();
  final userCollection = instance.collection("users");

  group("User Scenario", () {
    setUp(() {});
    test("test model", () async {
      var user = const User(
        name: 'joni',
        email: 'roni@gmail.com',
        password: "sotong123",
      );
      var user2 = const User(
        name: 'josni',
        email: 'ronsi@gmail.com',
        password: "sotong123",
      );

      //proses remove key
      final userMap = user.toJson();
      final userMap2 = user2.toJson();
      userMap.remove("id");
      userMap.remove("id");

//insert
      await userCollection.add(userMap);
      await userCollection.add(userMap2);

      //query ambil data
      final snapshot = await userCollection.get();
      final users = snapshot.docs.map((e) {
        final user = User.fromJson(e.data());
        return user.copyWith(id: e.id);
      });
      // print(users);

      //ambil data
      final userData = await userCollection
          .where("email", isEqualTo: "rosi@gmail.com")
          .get();

      final userResult = userData.docs.map((e) {
        User user = User.fromJson(e.data());
        return user.copyWith(id: e.id);
      });
      print(userResult.length);
    });
  });
}
