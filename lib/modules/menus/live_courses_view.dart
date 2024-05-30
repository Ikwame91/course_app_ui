import 'package:flutter/material.dart';
import 'package:flutter_english_course/components/components.dart';
import 'package:flutter_english_course/cores/cores.dart';

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
        onRefresh: () async {
          //load data here
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18)
                    .copyWith(bottom: 10),
                child: Text(
                  "Wonderful Live Courses Interact with Teachers",
                  style: p15.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
