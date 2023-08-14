import 'package:flutter/material.dart';
import 'package:solace/views/screens/login_page.dart';

class LoginBefore extends StatefulWidget {
  const LoginBefore({super.key});

  @override
  State<LoginBefore> createState() => _LoginBeforeState();
}

class _LoginBeforeState extends State<LoginBefore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/meditate.gif',
                height: 250,
              ),
              const Text(
                'Connect with us and get rid of your worries!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding:
                        const EdgeInsets.all(16.0), // Adjust padding as needed
                  ),
                  child: const Icon(Icons.arrow_downward))
            ],
          ),
        ),
      ),
    );
  }
}
