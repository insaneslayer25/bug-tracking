import 'package:bug_tracking/app_lib.dart';

class ReportProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> reports = [];

  void addReport(Map<String, dynamic> report) {
    reports.add(report);
    notifyListeners();
  }
}
