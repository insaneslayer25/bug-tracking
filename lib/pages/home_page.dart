import 'package:bug_tracking/app_lib.dart';
import 'package:intl/intl.dart';

String timeAndDate(String input) {
  String inputDateTimeStr = input;
  DateTime inputDateTime = DateTime.parse(inputDateTimeStr);
  DateFormat outputFormat = DateFormat("d MMMM ''yy hh:mm a");
  String formattedDateTime = outputFormat.format(inputDateTime);
  return formattedDateTime;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> filters = const [
    'All',
    'open',
    'closed',
  ];
  late String selectedFilter;
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  List<Map<String, dynamic>> applyFilter(List<Map<String, dynamic>> reports) {
    List<Map<String, dynamic>> filterreport = [];

    if (selectedFilter == 'All') {
      filterreport = reports;
    } else if (selectedFilter == 'open') {
      for (Map<String, dynamic> report in reports) {
        if (report['Status'] == 'open') {
          filterreport.add(report);
        }
      }
    } else {
      for (Map<String, dynamic> report in reports) {
        if (report['Status'] == 'closed') {
          filterreport.add(report);
        }
      }
    }
    return filterreport;
  }

  @override
  Widget build(BuildContext context) {
    final reports = Provider.of<ReportProvider>(context).reports;
    var reportsfinal = applyFilter(reports);
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
        padding: const EdgeInsets.fromLTRB(5, 4, 2, 4),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final currentfilter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {});
                        selectedFilter = currentfilter;
                        reportsfinal = applyFilter(
                            Provider.of<ReportProvider>(context, listen: false)
                                .reports);
                      },
                      child: Chip(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        backgroundColor: currentfilter == selectedFilter
                            ? const Color.fromARGB(255, 7, 198, 251)
                            : const Color.fromARGB(255, 255, 255, 255),
                        labelStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                        label: Text(currentfilter),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: reportsfinal.length,
                itemBuilder: (context, index) {
                  final currentMessage = reportsfinal[index];
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
