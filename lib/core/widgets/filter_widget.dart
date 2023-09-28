import 'package:bug_tracking/app_lib.dart';

class FilterWidget extends StatefulWidget {
  final String status;
  const FilterWidget({
    super.key,
    required this.status,
  });

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {},
        child: Chip(
          side: const BorderSide(
            width: 1,
          ),
          label: Text(
            widget.status,
            style: const TextStyle(color: Pallete.blackColor),
          ),
        ),
      ),
    );
  }
}
