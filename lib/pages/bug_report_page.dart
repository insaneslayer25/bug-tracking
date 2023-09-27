import 'package:bug_tracking/core/theme/pallete.dart';
import 'package:flutter/material.dart';

class BugReportingPage extends StatefulWidget {
  final String title;
  final String status;
  final String description;
  final String imagepath;
  final String datetime;
  const BugReportingPage({
    super.key,
    required this.datetime,
    required this.title,
    required this.status,
    required this.description,
    required this.imagepath,
  });

  @override
  State<BugReportingPage> createState() => _BugReportingPageState();
}

class _BugReportingPageState extends State<BugReportingPage> {
  @override
  Widget build(BuildContext context) {
    
    bool isOpen = widget.status == 'open' ? false : true;
    
    OutlineInputBorder border = OutlineInputBorder(
      borderSide:
          const BorderSide(color: Color.fromRGBO(225, 225, 225, 1), width: 4),
      borderRadius: BorderRadius.circular(20),
    );
    
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Switch(
              value: isOpen,
              onChanged: (value) {
                setState(() {
                  isOpen = value;
                });
              },
              activeTrackColor: Colors.green,
              activeColor: Colors.white,
              inactiveTrackColor: Colors.red,
              inactiveThumbColor: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Reported on :',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.datetime,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Text(
              'Report',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.description,
              style: const TextStyle(
                fontSize: 18,
                color: Pallete.blackColor,
              ),
            ),
            const Spacer(),
            Text(
              'Snaps of Bug',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              widget.imagepath,
              height: 500,
              width: 500,
            ),
            const Spacer(),
            SizedBox(
              width: 350,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'message',
                  hintStyle: const TextStyle(fontSize: 20),
                  prefixIcon: const Icon(
                    Icons.rocket,
                  ),
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
