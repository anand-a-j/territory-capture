import 'package:flutter/material.dart';
import 'package:territory_capture/core/extension/common.dart';

import '../theme/app_color_scheme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color backgroundColor;
  final List<Widget>? actions;
  final void Function()? leadingOnTap;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    super.key,
    this.title,
    this.leadingOnTap,
    this.actions,
    this.backgroundColor = AppColorScheme.scaffoldBackgroundColor,
    this.bottom,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      centerTitle: false,
      leading: leadingOnTap != null
          ? GestureDetector(
              onTap: leadingOnTap,
              child: const Icon(Icons.arrow_back),
            )
          : null,
      title: title != null
          ? Padding(
              padding: const EdgeInsetsDirectional.only(start: 16),
              child: Text(title!, style: context.titleMedium,),
            )
          : null,
      actions: actions,
      bottom: bottom,
    );
  }
}
