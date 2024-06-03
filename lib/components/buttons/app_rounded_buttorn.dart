import 'package:flutter/material.dart';
import 'package:flutter_english_course/cores/cores.dart';

class AppRoundedButton extends StatelessWidget {
  const AppRoundedButton({
    super.key,
    this.onpressed,
    required this.label,
    this.labelstyle,
    this.icon,
    this.color,
    this.labelColor,
    this.padding,
    this.height = 50,
    this.width,
    this.useBorder = false,
    this.expanded = true,
  });

  final VoidCallback? onpressed;
  final String label;
  final TextStyle? labelstyle;
  final Widget? icon;
  final Color? color, labelColor;
  final EdgeInsetsGeometry? padding;
  final double? height, width;
  final bool useBorder, expanded;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(30);
    final colorButton = onpressed == null
        ? context.theme.shadowColor.withOpacity(0.5)
        : (color ??
            (useBorder
                ? context.theme.appBarTheme.backgroundColor
                : context.theme.colorScheme.background));

    return Padding(
      padding: !expanded
          ? const EdgeInsets.all(0)
          : (padding ?? const EdgeInsets.symmetric(horizontal: 20)),
      child: InkWell(
        onTap: onpressed,
        borderRadius: borderRadius,
        child: Ink(
          decoration: BoxDecoration(
              color: colorButton,
              borderRadius: borderRadius,
              border: colorButton!.computeLuminance() >= 0.5 && useBorder
                  ? Border.all(color: Colors.white)
                  : Border.all(color: Colors.black)),
          height: height,
          width: width ?? context.screenWidth,
          child: Row(
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: icon!,
                ),
              Text(
                label,
                style: labelstyle ??
                    TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: labelColor ??
                            (colorButton.computeLuminance() >= 0.5
                                ? Colors.black
                                : Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
