import 'package:flutter/material.dart';
import 'package:spotify_app/presentation/widget/custom_appBar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() {
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppbar());
  }
}
