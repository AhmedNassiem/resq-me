import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
 final void Function()? onPressed;

  final IconData icon;
  const Button(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.sizeOf(context).width / 3.5,
        height: MediaQuery.sizeOf(context).width / 3.5,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: InkWell(
          
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          onTap: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
                size: 60,
              ),
              Text(title)
            ],
          ),
        ));
  }
}
