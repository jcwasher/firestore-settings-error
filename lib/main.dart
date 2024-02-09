import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_settings_error/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseFirestore.instance.settings = const Settings(
    ignoreUndefinedProperties: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Settings Error',
      home: Scaffold(
        body: Center(
          child: TextButton(
            child: const Text('Click me'),
            onPressed: () async {
              final doc = await FirebaseFirestore.instance
                  .collection('testing')
                  .doc('cM5HVGdmTLdLaQVEs9Ek')
                  .get();
              print(doc.data());
            },
          ),
        ),
      ),
    );
  }
}
