import 'package:flutter/material.dart';
import 'package:leave_app/leave_approval.dart';
import 'package:leave_app/leave_form.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leave Management'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LeaveForm();
                  }));
                },
                child: const Text("Apply")),
            const SizedBox(
              width: 30,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LeaveApproval();
                  }));
                },
                child: const Text("Approve"))
          ],
        ),
      ),
    );
  }
}
