import 'package:flutter/material.dart';
import 'package:flutter_english_course/cores/cores.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';

class PremiumCard extends StatelessWidget {
  const PremiumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: context.screenWidth,
      margin: const EdgeInsets.only(right: 18, left: 18, bottom: 20, top: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF292929),
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
            image: AssetImage(
          Assets.images.blackBackgroud,
        )),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200]!,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 6, left: 10),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black26,
                                    border: Border.all(
                                        color: const Color(0xFFF08F41))),
                                child: SvgPicture.asset(
                                  Assets.iconsSVG.premium,
                                  height: 13,
                                  width: 14,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Get Premium',
                                  style: p18.bold.yellow,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 8),
                          child: Text(
                            'Go to the Next Course',
                            style: p14.grey,
                          ),
                        ))
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 11),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(colors: [
                            AppColors.lightyellow,
                            AppColors.yellow
                          ])),
                      child: Text(
                        'Subscribe',
                        style: p14.brown,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: context.screenWidth,
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 13),
            decoration: const BoxDecoration(
              color: Color(0xFF363535),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIconButton(
                    icon: LineIcons.book,
                    label: "Courses",
                    onpressed: () {},
                  ),
                  VerticalDivider(
                    width: 3,
                    thickness: 2,
                    color: const Color(0xFF909090).withOpacity(0.3),
                  ),
                  _buildIconButton(
                    icon: LineIcons.video,
                    label: "Live",
                    onpressed: () {},
                  ),
                  VerticalDivider(
                    width: 3,
                    thickness: 2,
                    color: const Color(0xFF909090).withOpacity(0.3),
                  ),
                  _buildIconButton(
                    icon: LineIcons.graduationCap,
                    label: "Features",
                    onpressed: () {},
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildIconButton({
  required IconData icon,
  required String label,
  required void Function()? onpressed,
}) {
  return InkWell(
    onTap: onpressed,
    child: Row(
      children: [
        Icon(icon, color: const Color(0xFFE0C52A)),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF909090),
          ),
        )
      ],
    ),
  );
}
