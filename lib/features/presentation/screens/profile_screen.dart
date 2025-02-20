import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            AssetImage('assets/profile_placeholder.png'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Parent Name',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'parent.email@example.com',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Divider(),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Phone Number'),
                  subtitle: Text('+1234567890'),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Address'),
                  subtitle: Text('123, Sample Street, City, Country'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.school),
                  title: Text('Student Name'),
                  subtitle: Text('Child Name'),
                ),
                ListTile(
                  leading: Icon(Icons.class_),
                  title: Text('Class & Section'),
                  subtitle: Text('8th Grade - Section A'),
                ),
                ListTile(
                  leading: Icon(Icons.calendar_today),
                  title: Text('Academic Year'),
                  subtitle: Text('2023-2024'),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Edit Profile'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
