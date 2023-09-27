import 'package:bug_tracking/pages/bug_report_page.dart';
import 'package:bug_tracking/core/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:bug_tracking/core/global_variable.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String timeAndDate(String input) {
      String inputDateTimeStr = input;
      DateTime inputDateTime = DateTime.parse(inputDateTimeStr);
      DateFormat outputFormat = DateFormat("d MMMM ''yy hh:mm a");
      String formattedDateTime = outputFormat.format(inputDateTime);

      return formattedDateTime;
    }

    final status = [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.done,
          color: Colors.green,
          size: 30,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.lock_open_outlined,
          color: Colors.red,
          size: 30,
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        centerTitle: true,
        title: const Text(
          'PayIt',
          style: TextStyle(
            color: Pallete.blackColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle_rounded,
              size: 30,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(4, 10, 4, 10),
        child: ListView.builder(
          itemCount: message.length,
          itemBuilder: (context, index) {
            final currentMessage = message[index];
            final currentTime = timeAndDate(currentMessage['Time'] as String);
            final currentTitle = currentMessage['Title'] as String;
            final currentStatus = currentMessage['Status'] as String;
            final currentDescription = currentMessage['Description'] as String;
            final currentImagePath = currentMessage['Snapshot'] as String;
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return BugReportingPage(
                          datetime: currentTime,
                          title: currentTitle,
                          status: currentStatus,
                          description: currentDescription,
                          imagepath: currentImagePath,
                        );
                      },
                    ),
                  );
                },
                hoverColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: currentMessage['Status'] == 'open'
                        ? Colors.red
                        : Colors.green,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                title: Text(
                  currentMessage['Title'] as String,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                  child: Text(
                    currentTime,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                trailing:
                    currentMessage['Status'] == 'open' ? status[1] : status[0],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 148, 86, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tooltip: 'Add a new bug',
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
