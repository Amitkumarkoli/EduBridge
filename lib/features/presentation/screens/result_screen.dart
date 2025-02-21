import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  // Sample result data
  final List<Map<String, dynamic>> results = [
    {
      "examType": "Midterm Exam",
      "date": "2024-02-15",
      "score": 85,
      "grade": "A",
      "status": "Passed",
    },
    {
      "examType": "Final Exam",
      "date": "2024-06-20",
      "score": 72,
      "grade": "B",
      "status": "Passed",
    },
    {
      "examType": "Unit Test",
      "date": "2024-03-10",
      "score": 50,
      "grade": "C",
      "status": "Needs Improvement",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exam Results")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Enables horizontal scrolling
          child: DataTable(
            columns: [
              DataColumn(label: Text("Exam Type", style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text("Date", style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text("Overall Score", style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text("Grade", style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text("Status", style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text("Action", style: TextStyle(fontWeight: FontWeight.bold))),
            ],
            rows: results.map((result) {
              return DataRow(cells: [
                DataCell(Text(result["examType"])),
                DataCell(Text(result["date"])),
                DataCell(Text(result["score"].toString())),
                DataCell(Text(result["grade"])),
                DataCell(Text(result["status"], style: TextStyle(color: result["status"] == "Passed" ? Colors.green : Colors.red))),
                DataCell(
                  ElevatedButton(
                    onPressed: () {
                      _showDetailsDialog(context, result);
                    },
                    child: Text("View Details"),
                  ),
                ),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }

  // Function to show result details
  void _showDetailsDialog(BuildContext context, Map<String, dynamic> result) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Exam Details"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Exam Type: ${result['examType']}"),
            Text("Date: ${result['date']}"),
            Text("Overall Score: ${result['score']}"),
            Text("Grade: ${result['grade']}"),
            Text("Status: ${result['status']}"),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("Close")),
        ],
      ),
    );
  }
}
