import 'package:flutter/material.dart';

class TestCard extends StatefulWidget {
  const TestCard({super.key});

  @override
  State<TestCard> createState() => _TestCardState();
}

class _TestCardState extends State<TestCard> {
  String? myGroup;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RadioListTile(
              title: const Text(
                'ABC',
                style: TextStyle(color: Colors.white),
              ),
              value: 'ABC',
              groupValue: myGroup,
              onChanged: (value) {
                setState(() {
                  myGroup = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text(
                'DEF',
                style: TextStyle(color: Colors.white),
              ),
              value: 'DEF',
              groupValue: myGroup,
              onChanged: (value) {
                setState(() {
                  myGroup = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text(
                'GHI',
                style: TextStyle(color: Colors.white),
              ),
              value: 'GHI',
              groupValue: myGroup,
              onChanged: (value) {
                setState(() {
                  myGroup = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text(
                'JKL',
                style: TextStyle(color: Colors.white),
              ),
              value: 'JKL',
              groupValue: myGroup,
              onChanged: (value) {
                setState(() {
                  myGroup = value.toString();
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Next'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
