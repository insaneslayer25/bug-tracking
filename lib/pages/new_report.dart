import 'package:bug_tracking/app_lib.dart';
import 'package:intl/intl.dart';

String addTimeAndDate() {
  DateTime currentDateTime = DateTime.now();
  DateFormat outputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  String formattedDateTime = outputFormat.format(currentDateTime);
  return formattedDateTime;
}

class NewReport extends StatefulWidget {
  const NewReport({super.key});

  @override
  State<NewReport> createState() => _NewReportState();
}

class _NewReportState extends State<NewReport> {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController priority = TextEditingController();
  final border = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 2,
      color: Color.fromRGBO(225, 225, 225, 1),
    ),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: const Text('New Report'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Title',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 80,
                      child: TextField(
                        controller: title,
                        decoration: InputDecoration(
                          hintText: 'Max ten words',
                          enabledBorder: border,
                          border: border,
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Report',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 200,
                      child: TextField(
                        controller: description,
                        maxLines: null,
                        expands: true,
                        decoration: InputDecoration(
                          // isCollapsed: true,
                          hintText: 'Minimum 50 words',
                          enabledBorder: border,
                          border: border,
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownMenu(
                      controller: priority,
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      label: const Text(
                        'Priority',
                        style: TextStyle(fontSize: 17),
                      ),
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(value: 'P1', label: 'P1'),
                        DropdownMenuEntry(value: 'P2', label: 'P2'),
                        DropdownMenuEntry(value: 'P3', label: 'P3'),
                        DropdownMenuEntry(value: 'P4', label: 'P4'),
                      ],
                      onSelected: (value) {
                        priority.text = value ?? '';
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        fixedSize: const Size(
                          250,
                          45,
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.photo,
                        color: Colors.black,
                      ),
                      label: const Text(
                        'Add Snaps of bug here',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: const Color.fromARGB(255, 234, 0, 255),
                ),
                onPressed: () {
                  final nowTime = addTimeAndDate();

                  if (title.text.isNotEmpty &&
                      description.text.isNotEmpty &&
                      priority.text.isNotEmpty) {
                    Provider.of<ReportProvider>(context, listen: false)
                        .addReport({
                      'Title': title.text,
                      'Description': description.text,
                      'Time': nowTime,
                      'Status': 'open',
                      'Snapshot': 'assets/images/message_error.jpg',
                      'Priority': priority.text,
                    });
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Report Succesfully Sent'),
                    ));
                    Navigator.of(context).pop();
                  } else if (title.text.isEmpty &&
                      description.text.isEmpty &&
                      priority.text == '') {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const Alert(
                          message: 'Please fill all required details',
                        );
                      },
                    );
                  } else if (priority.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const Alert(
                          message: 'Please assign Priority',
                        );
                      },
                    );
                  }
                },
                icon: const Icon(
                  Icons.send,
                  color: Colors.black,
                ),
                label: const Text(
                  'Send Report',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
