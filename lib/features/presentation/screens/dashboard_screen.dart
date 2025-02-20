import 'package:edubridge/features/presentation/notice_screen.dart';
import 'package:edubridge/features/presentation/screens/event_screen.dart';
import 'package:edubridge/features/presentation/screens/prizes_screen.dart';
import 'package:edubridge/features/presentation/screens/result_screen.dart';
import 'package:edubridge/features/presentation/screens/teacher_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/providers/navigation_provider.dart';
import 'query_screen.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';
import 'assignment_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.school, color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Student Name', style: TextStyle(color: Colors.black)),
            SizedBox(width: 5),
            Icon(Icons.language, color: Colors.black),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: IndexedStack(
        index: navigationProvider.currentIndex,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Text(
                        'Attendance Viewport',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Icon(Icons.calendar_month, color: Colors.black),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.grey[300],
                          ),
                          child:
                              Icon(Icons.person, color: Colors.black, size: 60),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 34),
                            Container(
                              width: 180,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Field 1',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Container(
                              width: 180,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Field 2',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  padding: EdgeInsets.all(16),
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AssignmentScreen())),
                      child:
                          _buildDashboardBox(Icons.assignment, 'Assignments'),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NoticeBoardScreen())),
                      child: _buildDashboardBox(
                          Icons.notifications, 'Notice Board'),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EventsScreen())),
                      child: _buildDashboardBox(Icons.event, 'Events'),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultsScreen())),
                      child: _buildDashboardBox(Icons.assessment, 'Results'),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PrizesScreen())),
                      child: _buildDashboardBox(Icons.emoji_events, 'Prizes'),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeachersScreen())),
                      child: _buildDashboardBox(Icons.people, 'Teachers'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          QueryScreen(),
          NotificationScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationProvider.currentIndex,
        onTap: (index) => navigationProvider.setIndex(index),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer, color: Colors.black),
              label: 'Query'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications, color: Colors.black),
              label: 'Notifications'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildDashboardBox(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.black),
          SizedBox(height: 8),
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
