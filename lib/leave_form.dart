import 'package:flutter/material.dart';

enum LeaveMode { half, full, both }

class LeaveForm extends StatelessWidget {
  const LeaveForm({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode descriptionFocusNode = FocusNode();
    TextEditingController _dateController = TextEditingController();

    Future<void> selectDate(BuildContext context) async {
      DateTime currentDate = DateTime.now();

      DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

      if (selectedDate != null) {
        _dateController.text =
            "${selectedDate.toLocal()}".split(' ')[0]; // Format as YYYY-MM-DD
      }
    }

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Leave Application',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.teal),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownMenu<String>(
                width: 330,
                hintText: "Leave Type",
                onSelected: (value) {},
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: "id", label: "Casual"),
                  DropdownMenuEntry(value: "id", label: "Sick"),
                  DropdownMenuEntry(value: "id", label: "Previlege"),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              SizedBox(
                width: 330,
                child: SegmentedButton<LeaveMode>(
                  segments: const <ButtonSegment<LeaveMode>>[
                    ButtonSegment(value: LeaveMode.half, label: Text('Half')),
                    ButtonSegment(value: LeaveMode.full, label: Text('Full')),
                    ButtonSegment(
                        value: LeaveMode.both, label: Text('Combination')),
                  ],
                  selected: const <LeaveMode>{LeaveMode.half},
                  onSelectionChanged: (Set newSelection) {
                    // setState(() {
                    //   selection = newSelection;
                    // });
                  },
                  multiSelectionEnabled: true,
                ),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              TextField(
                controller: _dateController,
                readOnly: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.calendar_month),
                  hintText: "Select Dates",
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                ),
                onTap: () async {
                  await selectDate(context);
                },
              ),
              const Divider(),
              const Text(
                "Days : ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              const SizedBox(height: 20),
              TextField(
                focusNode: descriptionFocusNode,
                maxLines: 8,
                decoration: const InputDecoration(
                  hintText: "Reason",
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.teal),
                        onPressed: () {},
                        child: const Text("Apply")),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
