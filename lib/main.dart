import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solace/views/screens/before_login.dart';
import 'package:solace/views/screens/chat_screen.dart';
import 'package:solace/views/screens/home_page.dart';
import 'package:solace/views/screens/login_page.dart';

import 'constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Solace",
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Container(),
//       ),
//     );
//   }
// }

// StreamBuilder<User?>(
//             stream: FirebaseAuth.instance.authStateChanges(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return CircularProgressIndicator(
//                   color: secondaryColor,
//                 );
//               } else if (snapshot.hasData) {
//                 return const HomePage(); //send to main app flow
//               } else if (snapshot.hasError) {
//                 return (const Text("There was an Error!"));
//               } else {
//                 return const LoginBefore(); // send to login page
//               }
//             }),
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Solace",
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: ChatBotScreen()),
    );
  }
}
