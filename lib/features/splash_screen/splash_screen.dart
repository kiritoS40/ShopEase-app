import 'package:shopease/common/widgets/bottom_bar.dart';
import 'package:shopease/features/admin/screens/bottom_bar.dart';
import 'package:shopease/features/auth/screens/auth_screen.dart';
import 'package:shopease/features/auth/services/auth_service.dart';
import 'package:shopease/models/user.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: AuthService().getUserData(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Future.delayed(Duration.zero, () {
              if (snapshot.data!.type == 'admin') {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdminScreen()));
              } else if (snapshot.data!.type == 'user') {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const BottomBar()));
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AuthScreen()));
              }
            });

            return Container(
              constraints: const BoxConstraints.expand(),
              child: Image.asset(
                'assets/images/splash_screen.png',
                fit: BoxFit.cover,
              ),
            );
          } else {
            return Container(
              constraints: const BoxConstraints.expand(),
              child: Image.asset(
                'assets/images/splash_screen.png',
                fit: BoxFit.cover,
              ),
            );
          }
        },
      ),
    );
  }
}

late final User user;
