import 'package:flutter/material.dart';

class AuthMessage extends StatelessWidget {
  final String title;
  final String subtitle;
  const AuthMessage({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: _textTheme.displayLarge),
        const SizedBox(height: 12),
        Text(subtitle,
            style: _textTheme.titleSmall!
                .copyWith(fontWeight: FontWeight.w400, fontSize: 17)),
      ],
    );
  }
}
