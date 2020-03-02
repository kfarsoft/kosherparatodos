import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kosherparatodos/user_repository.dart';
import 'package:provider/provider.dart';

class UserInfoPage extends StatelessWidget {
  final FirebaseUser user;

  const UserInfoPage({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(user.email),
            RaisedButton(
              child: Text("SIGN OUT"),
              onPressed: () => Provider.of<UserRepository>(context, listen: false).signOut(),
            )
          ],
        ),
      ),
    );
  }
}