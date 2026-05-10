import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height = 80,
    this.width = double.infinity,
    this.isLoading = false
  });

  final String title;
  final void Function() onPressed;
  final double height;
  final double width;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(minimumSize: Size(width, height)),
      child: isLoading ? CircularProgressIndicator() : Text(title),
      // child: CircularProgressIndicator(),
    );
  }
}
