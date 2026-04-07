import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingLogo extends StatelessWidget {
  final String text;

  const LoadingLogo({this.text = "جاري المعالجة..."});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/logo.json',
              width: 120,
              height: 120,
              repeat: true,
            ),
            SizedBox(height: 15),
            Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
