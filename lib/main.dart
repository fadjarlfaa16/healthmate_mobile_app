import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Import pages
import 'utils/auth.dart';
import 'screen/login.dart';
import 'screen/register.dart';
import 'screen/app.dart';
import 'screen/mainhome/chatbot.dart';
import 'screen/mainhome/bmi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // The MaterialApp uses the Splash page as the initial route.
  // We also include an onGenerateRoute middleware to guard protected routes.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthMate',
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      onGenerateRoute: (RouteSettings settings) {
        // For protected routes, check if a user is logged in.
        if (settings.name == '/main' || settings.name == '/chat') {
          if (FirebaseAuth.instance.currentUser == null) {
            return MaterialPageRoute(builder: (_) => const LoginPage());
          }
          if (settings.name == '/main') {
            return MaterialPageRoute(builder: (_) => const MainPage());
          } else if (settings.name == '/chat') {
            return MaterialPageRoute(builder: (_) => const ChatPage());
          }
        }
        // For all other routes, let the defined routes handle them.
        return null;
      },
      routes: {
        '/splash': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/bmi': (context) => const BMIPredictionPage(),
      },
    );
  }
}
