import 'package:flutter/material.dart';


class LocationState extends StatefulWidget {
  const LocationState({super.key});

  @override
  State<LocationState> createState() => _LocationStateState();
}

class _LocationStateState extends State<LocationState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Location Activity"),
    );
  }
}
