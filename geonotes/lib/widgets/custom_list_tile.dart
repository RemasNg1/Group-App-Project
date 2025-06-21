import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData leadingIcon;
  final Color leadingIconColor;
  final String title;
  final Color titleColor;
  final Widget? trailing;
  final VoidCallback? onTrailingTap;
  final EdgeInsetsGeometry contentPadding;

  const CustomListTile({
    super.key,
    required this.leadingIcon,
    this.leadingIconColor = Colors.black,
    required this.title,
    this.titleColor = Colors.black,
    this.trailing,
    this.onTrailingTap,
    this.contentPadding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon, color: leadingIconColor),
      title: Text(title, style: TextStyle(color: titleColor)),
      trailing: trailing != null
          ? InkWell(onTap: onTrailingTap, child: trailing)
          : null,
      contentPadding: contentPadding,
    );
  }
}
