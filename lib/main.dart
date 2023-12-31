import 'package:shopease/constants/app_theme.dart';
import 'package:shopease/features/splash_screen/splash_screen.dart';
import 'package:shopease/providers/cart_offers_provider.dart';
import 'package:shopease/providers/screen_number_provider.dart';
import 'package:shopease/providers/user_provider.dart';
import 'package:shopease/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/utils.dart';

Future main() async {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
    ChangeNotifierProvider(create: (context) => ScreenNumberProvider()),
    ChangeNotifierProvider(create: (context) => CartOfferProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    precacheAllImage(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const SplashScreen(),
    );
  }
}
