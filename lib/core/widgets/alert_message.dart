import 'package:bug_tracking/app_lib.dart';

class Alert extends StatelessWidget {
  final String message;

  const Alert({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Warning',
        style: TextStyle(
          color: Colors.red,
        ),
      ),
      content: Text(
        message,
        style: const TextStyle(fontSize: 15),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Yeah! Got it',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
