import 'package:flutter/material.dart';

class LeaveApproval extends StatelessWidget {
  const LeaveApproval({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Leave Approval',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Current Leave DataTable
            const Text(
              'Current Leave',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Card(
              // color: Colors.teal[100],
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DataTable(
                  // headingRowColor:
                  //     WidgetStateProperty.resolveWith((state) => Colors.teal),
                  columns: const [
                    DataColumn(label: Text("Name")),
                    DataColumn(label: Text("Date")),
                    DataColumn(label: Text("Status")),
                    DataColumn(label: Text("Action")),
                  ],
                  rows: [
                    DataRow(cells: [
                      const DataCell(Text("AAA")),
                      const DataCell(Text("2/2/24")),
                      const DataCell(Text("Pending")),
                      DataCell(Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // ElevatedButton(
                          //     onPressed: () {}, child: const Text("allowed")),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                            iconSize: 30,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              color: Colors.red,
                              Icons.clear_outlined,
                            ),
                            iconSize: 30,
                          ),
                        ],
                      )),
                    ]),
                  ],
                ),
              ),
            ),
            const Divider(),

            // Text for previous leave section
            const Text(
              'Previous Leave',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),

            // ExpansionTile for Previous Leave DataTable
            ExpansionTile(
              title: const Text(
                "Show Previous Leave",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: const Icon(Icons.history),
              children: [
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text("Name")),
                        DataColumn(label: Text("Date")),
                        DataColumn(label: Text("Status")),
                      ],
                      rows: const [
                        DataRow(cells: [
                          DataCell(Text("AAA")),
                          DataCell(Text("2/2/24")),
                          DataCell(Text("Approved")),
                        ]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
