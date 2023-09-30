import 'package:bug_tracking/app_lib.dart';

class BugReportingPage extends StatefulWidget {
  final String title;
  final String status;
  final String description;
  final String imagepath;
  final String datetime;
  final String priority;
  const BugReportingPage({
    super.key,
    required this.datetime,
    required this.title,
    required this.status,
    required this.description,
    required this.imagepath,
    required this.priority,
  });

  @override
  State<BugReportingPage> createState() => _BugReportingPageState();
}

class _BugReportingPageState extends State<BugReportingPage> {
  @override
  Widget build(BuildContext context) {
    bool isOpen = widget.status == 'open' ? false : true;

    OutlineInputBorder border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
        width: 4,
      ),
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
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Card(
                          color: const Color.fromARGB(255, 100, 165, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              'Reported on ${widget.datetime}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              widget.priority,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
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
                    Text(
                      widget.description,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Snaps of Bug',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      widget.imagepath,
                      height: 600,
                      width: 600,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
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
