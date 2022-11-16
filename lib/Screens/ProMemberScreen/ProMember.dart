import 'package:flutter/material.dart';
import 'package:mentai/Screens/ProMemberScreen/components/ProMemberBody.dart';

class ProMember extends StatefulWidget {
  const ProMember({super.key});

  @override
  State<ProMember> createState() => _ProMemberState();
}

class _ProMemberState extends State<ProMember> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProMemberBody(),
    );
  }
}
