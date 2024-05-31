import 'package:flutter/material.dart';
import 'package:flutter_english_course/components/cards/live_courses_card.dart';
import 'package:flutter_english_course/components/components.dart';
import 'package:flutter_english_course/cores/cores.dart';
import 'package:flutter_english_course/dummies/live_courses_dummy.dart';
import 'package:flutter_english_course/models/course/live_course.dart';

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
                    height: 17,
                  ),
                  itemCount: liveCourses.length,
                  itemBuilder: (context, index) {
                    final item = liveCourses[index];
                    return LiveCourseCard(
                      item: item,
                      onPressed: () {},
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
