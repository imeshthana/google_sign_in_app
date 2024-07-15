import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_app/api/google_sign_in_api.dart';
import 'package:google_sign_in_app/screens/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  Future<void> signIn() async {
    final GoogleSignInAccount? user = await GoogleSignInApi.login();
    if (user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                  user: user,
                )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Google Sign In'),
      ),
      body: Center(
          child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
          foregroundColor: WidgetStateProperty.all(Colors.white),
        ),
        onPressed: signIn,
        child: const Text('Sign In with Google'),
      )),
    );
  }
}
