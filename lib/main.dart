import 'package:flutter/material.dart';
import 'package:payment_app/detail_screen.dart';
import 'package:payment_app/loader_page.dart';
import 'package:payment_app/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payment Demo',
      initialRoute: '/',
      routes: {
        '/animation': (context) => const AnimationScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
      home: const DetailScreen(),
    );
  }
}
