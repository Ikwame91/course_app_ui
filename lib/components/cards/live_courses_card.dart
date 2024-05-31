// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_english_course/components/common/user_info.dart';
import 'package:flutter_english_course/cores/cores.dart';
import 'package:flutter_english_course/models/course/live_course.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transparent_image/transparent_image.dart';

class LiveCourseCard extends StatelessWidget {
  final LiveCourse item;
  final Function()? onPressed;
  const LiveCourseCard({
    super.key,
    required this.item,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    const TextStyle textGreyStyle =
        TextStyle(color: AppColors.grey, fontSize: 15);
    const radius = 15.0;
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(radius),
      child: Ink(
        height: 160.0,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200]!,
              blurRadius: 3,
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 140,
                  width: 100,
                  child: CachedNetworkImage(
                    imageUrl: item.imageUrl,
                    errorWidget: (context, url, error) => const SizedBox(),
                    imageBuilder: (context, imageProvider) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FadeInImage(
                          placeholder: MemoryImage(kTransparentImage),
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black38),
                    child: SvgPicture.asset(
                      Assets.iconsSVG.premium,
                      height: 13,
                      width: 13,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3, bottom: 6),
                          child: UserInfo(
                            onPressed: () {},
                            title: item.teacher.name,
                            avatarURL: item.teacher.avatarURL,
                            maxRadius: 10,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            item.title.overflow,
                            style: p18.bold,
                            maxLines: 2,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Expanded(
                            child:
                                Text(item.liveDuration, style: textGreyStyle)),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            color: context.theme.primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          item.liveDuration.toString().toLowerCase(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4.5),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            item.level,
                            overflow: TextOverflow.ellipsis,
                            style: textGreyStyle.copyWith(fontSize: 14),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
