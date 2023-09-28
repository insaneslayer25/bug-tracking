import 'package:bug_tracking/app_lib.dart';

class BugTile extends StatelessWidget {
  final String time;
  final String title;
  final String status;
  final String description;
  final String imagePath;
  const BugTile(
      {super.key,
      required this.time,
      required this.title,
      required this.status,
      required this.description,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final statusIcon = [
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
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return BugReportingPage(
                datetime: time,
                title: title,
                status: status,
                description: description,
                imagepath: imagePath,
              );
            },
          ),
        );
      },
      hoverColor: Colors.grey,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: status == 'open' ? Colors.red : Colors.green,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
        child: Text(
          time,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      trailing: status == 'open' ? statusIcon[1] : statusIcon[0],
    );
  }
}
