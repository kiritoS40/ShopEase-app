import 'package:shopease/constants/utils.dart';
import 'package:shopease/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NameBar extends StatelessWidget {
  const NameBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user.name;

    return Container(
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 146, 132, 227),
                Color.fromARGB(255, 166, 186, 230),
              ]),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello, ',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            ),
            Text(
              capitalizeFirstLetter(string: user),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
