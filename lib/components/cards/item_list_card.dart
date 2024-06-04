import 'package:flutter/material.dart';
import 'package:flutter_english_course/cores/cores.dart';

class ItemListCard extends StatelessWidget {
  const ItemListCard({
    super.key,
    required this.icon,
    this.iconSize = 25,
    required this.name,
    this.data,
    this.trailing,
    this.onpressed,
  });

  final IconData icon;
  final double iconSize;
  final String name;
  final String? data;
  final Widget? trailing;
  final VoidCallback? onpressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Row(
          children: [
            SizedBox(
              width: 50,
              child: Icon(
                icon,
                size: iconSize,
                color: AppColors.grey,
              ),
            ),
            const Expanded(child: Padding(padding: EdgeInsets.all(20)))
          ],
        ),
      ),
    );
  }
}
