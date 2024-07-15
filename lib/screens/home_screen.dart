import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_app/api/google_sign_in_api.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.user});

  final GoogleSignInAccount user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> logout() async {
    await GoogleSignInApi.logout();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.user.photoUrl ?? ''),
              radius: 40,
            ),
            const SizedBox(height: 20),
            Text(
              'Name: ${widget.user.displayName}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: ${widget.user.email}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
                foregroundColor: WidgetStateProperty.all(Colors.white),
              ),
              onPressed: logout,
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
