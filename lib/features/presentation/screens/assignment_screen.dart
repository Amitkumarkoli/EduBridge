import 'package:flutter/material.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignments'),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Subject')),
            DataColumn(label: Text('Title')),
            DataColumn(label: Text('Due Date')),
            DataColumn(label: Text('Status')),
            DataColumn(label: Text('Action')),
          ],
          rows: [
            _buildDataRow('Math', 'Algebra Homework', '2024-02-25', 'Pending', context),
            _buildDataRow('Science', 'Physics Project', '2024-02-28', 'Completed', context),
            _buildDataRow('English', 'Essay Writing', '2024-03-01', 'Pending', context),
            _buildDataRow('History', 'World War II Assignment', '2024-03-05', 'Pending', context),
          ],
        ),
      ),
    );
  }

  DataRow _buildDataRow(String subject, String title, String dueDate, String status, BuildContext context) {
    return DataRow(cells: [
      DataCell(Text(subject)),
      DataCell(Text(title)),
      DataCell(Text(dueDate)),
      DataCell(Text(status)),
      DataCell(
        TextButton(
          onPressed: () {
            _showAssignmentDetail(context, subject, title, dueDate, status);
          },
          child: Text('View Details'),
        ),
      ),
    ]);
  }

  void _showAssignmentDetail(BuildContext context, String subject, String title, String dueDate, String status) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Assignment Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Subject: $subject'),
              Text('Title: $title'),
              Text('Due Date: $dueDate'),
              Text('Status: $status'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
