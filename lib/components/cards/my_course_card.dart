// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_english_course/components/components.dart';
import 'package:flutter_english_course/cores/cores.dart';
import 'package:flutter_english_course/models/course/video_course.dart';
import 'package:transparent_image/transparent_image.dart';

class MyCourseCard extends StatelessWidget {
  const MyCourseCard({
    Key? key,
    required this.courses,
  }) : super(key: key);

  final List<VideoCourse> courses;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 13),
      margin:
          const EdgeInsets.only(right: 18.5, left: 18.5, bottom: 20, top: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SubHeader(
              title: 'My Courses',
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: context.screenWidth,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: courses
                    .take(courses.length > 5 ? 5 : courses.length)
                    .map((item) => buildMyCourses(
                          context,
                          imageUrl: item.imageUrl,
                          onpressed: () {},
                        ))
                    .toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}

Widget buildMyCourses(BuildContext context,
    {required String imageUrl, required void Function()? onpressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: GestureDetector(
      onTap: onpressed,
      child: Stack(
        children: [
          SizedBox(
            height: context.screenWidth * 0.38,
            width: context.screenWidth * 0.38,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              errorWidget: (context, url, error) => const SizedBox(),
              imageBuilder: (context, imageProvider) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          )
        ],
      ),
    ),
  );
}
