import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    required this.prefix,
    required this.suffix,
    this.onTap,
  });

  final String title;
  final String prefix;
  final String suffix;
  final Function()? onTap;

  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: SizedBox.shrink(),
      leadingWidth: 0.0,

      toolbarHeight: preferredSize.height,
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0.0,

      //xMAG3
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(onTap: onTap,child: SvgPicture.asset(prefix)),
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          SvgPicture.asset(suffix),
        ],
      ),
    );
  }
}
