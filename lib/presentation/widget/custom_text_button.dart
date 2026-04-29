import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height = 80,
    this.width = double.infinity,
  });

  final String title;
  final void Function() onPressed;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(minimumSize: Size(width, height)),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 20),
      ),
    );
   
  }
}
