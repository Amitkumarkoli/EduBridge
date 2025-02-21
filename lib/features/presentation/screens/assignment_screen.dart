import 'package:flutter/material.dart';
import 'assignment_detail_screen.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({super.key});

  @override
  _AssignmentScreenState createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  String selectedSubject = 'All';
  String selectedSort = 'Due Date';
  String searchQuery = '';

  final List<Map<String, String>> assignments = [
    {
      'subject': 'Mathematics',
      'title': 'Math Homework - Algebra Worksheet',
      'dueDate': '2024-07-15',
      'status': 'Submitted',
      'assignedDate': '2024-07-10',
      'description':
          'Solve the algebra worksheet covering linear equations and quadratic expressions.',
      'attachedFile': 'Algebra_Worksheet.pdf',
      'submissionDate': '2024-07-14',
      'feedback': 'Good attempt! Work on quadratic equations.',
      'resubmission': 'No',
    },
    {
      'subject': 'Science',
      'title': 'Physics Lab Report',
      'dueDate': '2024-07-20',
      'status': 'Not Submitted',
      'assignedDate': '2024-07-12',
      'description': 'Write a lab report on Newton’s second law of motion.',
      'attachedFile': '',
      'submissionDate': '',
      'feedback': '',
      'resubmission': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredAssignments =
        assignments.where((assignment) {
      bool matchesSubject =
          selectedSubject == 'All' || assignment['subject'] == selectedSubject;

      bool matchesSearch = searchQuery.isEmpty ||
          assignment['title']!
              .toLowerCase()
              .contains(searchQuery.toLowerCase());

      return matchesSubject && matchesSearch;
    }).toList();

    filteredAssignments.sort((a, b) {
      if (selectedSort == 'Due Date') {
        return a['dueDate']!.compareTo(b['dueDate']!);
      } else if (selectedSort == 'Status') {
        return a['status']!.compareTo(b['status']!);
      }
      return 0;
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignments'),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildFilters(),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Subject')),
                  DataColumn(label: Text('Title')),
                  DataColumn(label: Text('Due Date')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Action')),
                ],
                rows: filteredAssignments.map((assignment) {
                  return _buildDataRow(assignment, context);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          setState(() {
            searchQuery = value;
          });
        },
        decoration: const InputDecoration(
          hintText: 'Search Assignments by name',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildFilters() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          DropdownButton<String>(
            value: selectedSubject,
            onChanged: (value) {
              setState(() {
                selectedSubject = value!;
              });
            },
            items: ['All', 'Mathematics', 'Science']
                .map((subject) =>
                    DropdownMenuItem(value: subject, child: Text(subject)))
                .toList(),
          ),
          const SizedBox(width: 10),
          DropdownButton<String>(
            value: selectedSort,
            onChanged: (value) {
              setState(() {
                selectedSort = value!;
              });
            },
            items: ['Due Date', 'Status']
                .map((sort) => DropdownMenuItem(value: sort, child: Text(sort)))
                .toList(),
          ),
        ],
      ),
    );
  }

  DataRow _buildDataRow(Map<String, String> assignment, BuildContext context) {
    return DataRow(cells: [
      DataCell(Text(assignment['subject']!)),
      DataCell(Text(assignment['title']!)),
      DataCell(Text(assignment['dueDate']!)),
      DataCell(Text(assignment['status'] == 'Submitted'
          ? '✅ Submitted'
          : '❌ Not Submitted')),
      DataCell(
        TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AssignmentDetailScreen(assignment: assignment),
                ));
          },
          child: const Text('View Details'),
        ),
      ),
    ]);
  }
}
