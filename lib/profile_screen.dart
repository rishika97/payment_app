import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Profile picture and name section
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/300'), // Replace with your profile picture URL
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mae Jamison',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text('maej@gmail.com'),
                  ],
                ),
              ],
            ),
          ),
          // Divider
          const Divider(thickness: 1.0),
          // List of profile sections
          ListTile(
            title: const Text('Search Settings'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Handle navigation to search settings screen
            },
          ),
          ListTile(
            title: const Text('Personal Info'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Handle navigation to personal info screen
            },
          ),
          ListTile(
            title: const Text('My QR Code'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Handle navigation to QR code screen
            },
          ),
          ListTile(
            title: const Text('Banks and Cards'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Handle navigation to banks and cards screen
            },
          ),
          ListTile(
            title: const Text('Payment Preferences'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Handle navigation to payment preferences screen
            },
          ),
          ListTile(
            title: const Text('Automatic Payments'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Handle navigation to automatic payments screen
            },
          ),
          ListTile(
            title: const Text('Login and Security'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Handle navigation to login and security screen
            },
          ),
          ListTile(
            title: const Text('Notifications'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Handle navigation to notifications screen
            },
          ),
        ],
      ),
    );
  }
}
