import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? onLeading;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onLeading,
    this.actions
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        maxLines: 2,
      ),
      elevation: 0,
      centerTitle: true,
      leading: onLeading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}