import 'package:bug_tracking/app_lib.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 0,
        ),
        child: Column(
          children: [
            Image.asset(
              Constants.logopath,
              height: 40,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Dive into BugT ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                Constants.loginemotepath,
                height: 400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  }));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade300,
                    minimumSize: const Size(
                      double.infinity,
                      50,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    )),
                child: const Text(
                  'Login Here',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
