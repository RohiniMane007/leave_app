import 'package:flutter/material.dart';

enum LeaveMode { half, full, both }

class LeaveForm extends StatelessWidget {
  const LeaveForm({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode descriptionFocusNode = FocusNode();
    TextEditingController _dateController =
        TextEditingController(); // Controller for date field

    Future<void> selectDate(BuildContext context) async {
      // Get the current date
      DateTime currentDate = DateTime.now();
      // Show the date picker dialog
      DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

      if (selectedDate != null) {
        // Format and set the selected date
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
              // Date Field Section
              const SizedBox(height: 10),

              SizedBox(
                width: 330,
                child: SegmentedButton<LeaveMode>(
                  segments: const <ButtonSegment<LeaveMode>>[
                    ButtonSegment(value: LeaveMode.half, label: Text('Half')),
                    ButtonSegment(value: LeaveMode.full, label: Text('Full')),
                    ButtonSegment(value: LeaveMode.both, label: Text('Both')),
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

              // Leave Mode Section
              const SizedBox(height: 10),

              const Divider(),
              // Date Field Section
              const SizedBox(height: 10),

              // AbsorbPointer(

              //     child:
              TextField(
                controller: _dateController, // Set the date controller
                readOnly: true,
                decoration: const InputDecoration(
                  hintText: "Select Dates",
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                ),
                onTap: () async {
                  await selectDate(context);
                },
              ),
              ListTile(
                leading: Checkbox.adaptive(value: false, onChanged: (value) {}),
                title: const Text(
                  "Half Day",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
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
      /* Container(
        height: 400,
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RadioMenuButton(
                    value: false,
                    groupValue: selectedVal,
                    onChanged: (v) {
                      selectedVal = v!;
                    },
                    child: const Text("casual")),
                RadioMenuButton(
                    value: false,
                    groupValue: selectedVal,
                    onChanged: (v) {
                      selectedVal = v!;
                    },
                    child: const Text("sick")),
                RadioMenuButton(
                    value: false,
                    groupValue: selectedVal,
                    onChanged: (v) {
                      selectedVal = v!;
                    },
                    child: const Text("annual"))
              ],
            ),
            const Divider(),
            const Text("Leave Mode"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text("Half Day")),
                ElevatedButton(onPressed: () {}, child: const Text("Full Day")),
                ElevatedButton(
                    onPressed: () {}, child: const Text("Alternative"))
              ],
            ),
            const TextField(
              decoration: InputDecoration(
                  hintText: "Date",
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()),
            ),
            const Divider(),
            const Text("Description"),
            const TextField(
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: "",
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()),
            ),
          ],
        ),
      ),*/
    );
  }
}
