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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: p20.bold.grey),
                    if (data != null)
                      Text(
                        data!,
                        style: const TextStyle(
                          fontSize: 29,
                          color: AppColors.grey,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
