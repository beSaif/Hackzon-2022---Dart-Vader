import 'package:flutter/material.dart';
import 'package:mentai/Screens/AppSettingsScreen/components/AppSettingsBody.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: AppSettingsBody()),
    );
  }
}
