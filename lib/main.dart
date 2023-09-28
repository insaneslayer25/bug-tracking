import 'package:bug_tracking/app_lib.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BugT',
      theme: Pallete.lightModeAppTheme.copyWith(
        useMaterial3: true,
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Pallete.blackColor,
          ),
          bodyMedium: TextStyle(
            fontSize: 20,
            color: Pallete.blackColor,
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
