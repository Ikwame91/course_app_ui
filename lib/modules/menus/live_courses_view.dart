import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_english_course/components/buttons/app_rounded_buttorn.dart';
import 'package:flutter_english_course/components/cards/live_courses_card.dart';
import 'package:flutter_english_course/components/common/user_info.dart';
import 'package:flutter_english_course/components/components.dart';
import 'package:flutter_english_course/cores/cores.dart';
import 'package:flutter_english_course/dummies/live_courses_dummy.dart';
import 'package:flutter_english_course/models/course/live_course.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transparent_image/transparent_image.dart';

class LiveCoursesView extends StatefulWidget {
  static const String routeName = '/live-courses';

  const LiveCoursesView({super.key});

  @override
  State<LiveCoursesView> createState() => _LiveCoursesViewState();
}

class _LiveCoursesViewState extends State<LiveCoursesView> {
  final liveCourses = <LiveCourse>[];

  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<void> loadData() async {
    liveCourses
      ..clear()
      ..addAll(List<LiveCourse>.from(
          liveCoursesJSON.map((e) => LiveCourse.fromJson(e))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        centerTitle: false,
        title: Text(
          "Live Courses",
          style: context.theme.textTheme.titleLarge,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(14.0),
            child: Icon(
              AppIcons.calendar,
              size: 26,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: AppPullRefresh(
        onRefresh: loadData,
        //load data here

        child: SingleChildScrollView(
          primary: true,
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18)
                    .copyWith(bottom: 10),
                child: Text(
                  "Wonderful Live Courses Interact with Teachers",
                  style: p15.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 0),
                child: ListView.separated(
                  primary: false,
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 25,
                  ),
                  itemCount: liveCourses.length,
                  itemBuilder: (context, index) {
                    final item = liveCourses[index];
                    return LiveCourseCard(
                      item: item,
                      onPressed: () {
                        showAnimatedDialog(
                            context: context,
                            animationType: DialogTransitionType.slideFromBottom,
                            curve: Curves.ease,
                            barrierColor: Colors.black.withOpacity(0.8),
                            builder: (_) => AppointmentDialog(
                                  item: item,
                                ));
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentDialog extends StatelessWidget {
  const AppointmentDialog({super.key, required this.item});
  final LiveCourse item;
  @override
  Widget build(BuildContext context) {
    const radius = 20.0;
    final width = context.screenWidth * 0.9;
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Ink(
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(radius)),
              child: Column(
                children: [
                  SizedBox(
                    height: 200.0,
                    width: width,
                    child: CachedNetworkImage(
                      imageUrl: item.imageUrl,
                      errorWidget: (context, url, error) => const SizedBox(),
                      imageBuilder: (context, imageProvider) {
                        return ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(radius)),
                          child: FadeInImage(
                            placeholder: MemoryImage(kTransparentImage),
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Column(
                      children: [
                        Text(
                          item.title.overflow,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: p22.bold,
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Row(
                          children: [
                            Flexible(
                                child: UserInfo(
                              onPressed: () {},
                              title: item.teacher.name,
                              titleStyle: p16.grey,
                              avatarURL: item.teacher.avatarURL,
                            )),
                            Row(
                              children: [
                                const Icon(
                                  Icons.watch_later_outlined,
                                  color: AppColors.grey,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  item.liveTime.toDoMonthFormat().toLowerCase(),
                                  style: p16.grey,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 17),
                    child: AppRoundedButton(
                      onpressed: () => context.maybePop(),
                      label: "Appointment Now",
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: SvgPicture.asset(
                          Assets.iconsSVG.premium,
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            IconButton(
                onPressed: () {
                  context.maybePop();
                },
                icon: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2)),
                  child: const Icon(
                    Icons.close_rounded,
                    color: AppColors.white,
                    size: 20,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
