import 'package:flutter/material.dart';

class LeaveForm extends StatelessWidget {
  const LeaveForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _dateController =
        TextEditingController(); // Controller for date field

    Future<void> _selectDate(BuildContext context) async {
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownMenu<String>(
                  width: 200,
                  hintText: "Leave Type",
                  onSelected: (value) {},
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: "id", label: "Casual"),
                    DropdownMenuEntry(value: "id", label: "Sick"),
                    DropdownMenuEntry(value: "id", label: "Previlege"),
                  ],
                ),
                DropdownMenu<String>(
                  width: 200,
                  hintText: "Leave Mode",
                  onSelected: (value) {},
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: "half", label: "Half"),
                    DropdownMenuEntry(value: "full", label: "Full"),
                    DropdownMenuEntry(
                        value: "compensatory", label: "Compensatory"),
                  ],
                ),
              ],
            ),

            // Leave Mode Section
            const SizedBox(height: 10),

            const Divider(),
            // Date Field Section
            const SizedBox(height: 10),

            GestureDetector(
                onTap: () => _selectDate(context), // Open date picker on tap
                child: AbsorbPointer(
                    // Prevent typing in the field
                    child: TextField(
                        controller: _dateController, // Set the date controller
                        decoration: const InputDecoration(
                          hintText: "Select Dates",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                        )))),
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
            // Description Section
            const SizedBox(height: 20),
            const Text(
              "Description",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const TextField(
              maxLines: 8,
              decoration: InputDecoration(
                hintText: "Enter a description (optional)",
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
