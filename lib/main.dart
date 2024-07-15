import 'package:flutter/material.dart';
import 'package:google_sign_in_app/screens/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Google Sign In',
      home: SignInScreen(),
    );
  }
}
