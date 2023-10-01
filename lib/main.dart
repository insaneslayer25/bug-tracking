import 'package:bug_tracking/app_lib.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReportProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BugT',
        theme: ThemeData.light().copyWith(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            bodyMedium: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
