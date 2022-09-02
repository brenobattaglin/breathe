import 'package:breathe/breathe/widgets/lotus.dart';
import 'package:flutter/material.dart';

class BreathePage extends StatefulWidget {
  const BreathePage({Key? key}) : super(key: key);

  @override
  State<BreathePage> createState() => _BreathePageState();
}

class _BreathePageState extends State<BreathePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: LotusWidget(),
      ),
    );
  }
}
