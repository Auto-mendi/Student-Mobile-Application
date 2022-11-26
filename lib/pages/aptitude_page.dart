import 'package:flutter/material.dart';
import 'package:student_mobile_app/widgets/test_card.dart';

class AptitudePage extends StatefulWidget {
  const AptitudePage({super.key});

  @override
  State<AptitudePage> createState() => _AptitudePageState();
}

class _AptitudePageState extends State<AptitudePage> {
  String? myGroup;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: TestCard());
  }
}
