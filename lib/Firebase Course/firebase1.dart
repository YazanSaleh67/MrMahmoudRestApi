import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

class FireBase extends StatefulWidget {
  FireBase({Key? key}) : super(key: key);

  @override
  State<FireBase> createState() => _FireBaseState();
  
}

class _FireBaseState extends State<FireBase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Firebase",
            textAlign: TextAlign.center,
          ),
          titleSpacing: 115,
          backgroundColor: Colors.green,
        ),
        drawer: Drawer(),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(onPressed: () async {
              await signInWithGoogle() ;
             
            }, child: Text("sign in"))
          ]),
        ));
  }
}
