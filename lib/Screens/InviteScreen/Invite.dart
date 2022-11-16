import 'package:flutter/material.dart';
import 'package:mentai/Screens/InviteScreen/components/InviteBody.dart';

class Invite extends StatefulWidget {
  const Invite({super.key});

  @override
  State<Invite> createState() => _InviteState();
}

class _InviteState extends State<Invite> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: InviteBody(),
    );
  }
}
