import 'package:edubridge/features/presentation/notice_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/providers/navigation_provider.dart';
import '../../../core/providers/language_provider.dart';
import 'assignment_screen.dart';
import 'query_screen.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';
import 'package:edubridge/features/presentation/screens/event_screen.dart';
import 'package:edubridge/features/presentation/screens/result_screen.dart';
import 'package:edubridge/features/presentation/screens/prizes_screen.dart';
import 'package:edubridge/features/presentation/screens/teacher_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.school, color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              languageProvider.texts['student_name'] ?? 'Student Name',
              style: const TextStyle(color: Colors.black),
            ),
            DropdownButton<String>(
              icon: const Icon(Icons.language, color: Colors.black),
              underline: const SizedBox(),
              value: languageProvider.currentLocale.languageCode,
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'hi', child: Text('हिन्दी')),
              ],
              onChanged: (String? value) {
                if (value != null) {
                  languageProvider.changeLanguage(value);
                }
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: IndexedStack(
        index: navigationProvider.currentIndex,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
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
                          languageProvider.texts['attendance_viewport'] ??
                              'Attendance Viewport',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Positioned(
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
                            child: const Icon(Icons.person,
                                color: Colors.black, size: 60),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 34),
                              const SizedBox(
                                width: 180,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Field 1',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: 180,
                                child: const TextField(
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
                GridView.count(
                  padding: const EdgeInsets.all(16),
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AssignmentScreen()),
                      ),
                      child: _buildDashboardBox(
                        Icons.assignment,
                        languageProvider.texts['assignments'] ?? 'Assignments',
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NoticeBoardScreen()),
                      ),
                      child: _buildDashboardBox(
                        Icons.notifications,
                        languageProvider.texts['notice_board'] ??
                            'Notice Board',
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EventsScreen()),
                      ),
                      child: _buildDashboardBox(
                        Icons.event,
                        languageProvider.texts['events'] ?? 'Events',
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResultScreen()),
                      ),
                      child: _buildDashboardBox(
                        Icons.assessment,
                        languageProvider.texts['results'] ?? 'Results',
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PrizesScreen()),
                      ),
                      child: _buildDashboardBox(
                        Icons.emoji_events,
                        languageProvider.texts['prizes'] ?? 'Prizes',
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TeachersScreen()),
                      ),
                      child: _buildDashboardBox(
                        Icons.people,
                        languageProvider.texts['teachers'] ?? 'Teachers',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const QueryScreen(),
          const NotificationScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationProvider.currentIndex,
        onTap: (index) => navigationProvider.setIndex(index),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home, color: Colors.black),
            label: languageProvider.texts['home'] ?? 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.question_answer, color: Colors.black),
            label: languageProvider.texts['query'] ?? 'Query',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications, color: Colors.black),
            label: languageProvider.texts['notifications'] ?? 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person, color: Colors.black),
            label: languageProvider.texts['profile'] ?? 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardBox(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
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
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
