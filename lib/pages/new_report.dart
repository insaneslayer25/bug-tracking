import 'package:bug_tracking/app_lib.dart';

class NewReport extends StatefulWidget {
  const NewReport({super.key});

  @override
  State<NewReport> createState() => _NewReportState();
}

class _NewReportState extends State<NewReport> {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
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
      body: Padding(
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
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Pallete.blueColor,
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
                      color: Pallete.blackColor,
                    ),
                    label: const Text(
                      'Add Snaps of bug here',
                      style: TextStyle(
                        color: Pallete.blackColor,
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
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Report has succesfully send',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.send,
                color: Pallete.blackColor,
              ),
              label: const Text(
                'Send Report',
                style: TextStyle(
                  color: Pallete.blackColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
