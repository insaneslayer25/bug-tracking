import 'package:bug_tracking/app_lib.dart';
import 'package:bug_tracking/pages/new_report.dart';
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

    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: const Color.fromARGB(255, 179, 239, 253),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        centerTitle: true,
        title: const Text(
          'PayIt',
          style: TextStyle(
            color: Colors.black,
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
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  FilterWidget(status: 'All'),
                  FilterWidget(status: 'Open'),
                  FilterWidget(status: 'Close'),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: message.length,
                itemBuilder: (context, index) {
                  final currentMessage = message[index];
                  final currentTime =
                      timeAndDate(currentMessage['Time'] as String);
                  final currentTitle = currentMessage['Title'] as String;
                  final currentStatus = currentMessage['Status'] as String;
                  final currentDescription =
                      currentMessage['Description'] as String;
                  final currentImagePath = currentMessage['Snapshot'] as String;
                  final currentPriority = currentMessage['Priority'] as String;
                  return BugTile(
                    time: currentTime,
                    title: currentTitle,
                    status: currentStatus,
                    description: currentDescription,
                    imagePath: currentImagePath,
                    priority: currentPriority,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tooltip: 'Add a new bug',
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const NewReport();
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
