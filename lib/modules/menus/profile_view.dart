import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_english_course/components/cards/item_list_card.dart';
import 'package:flutter_english_course/components/cards/my_course_card.dart';
import 'package:flutter_english_course/components/cards/premium_card.dart';
import 'package:flutter_english_course/components/common/photo_avatar.dart';
import 'package:flutter_english_course/components/components.dart';
import 'package:flutter_english_course/cores/cores.dart';
import 'package:flutter_english_course/dummies/users_dummy.dart';
import 'package:flutter_english_course/dummies/video_courses_dummy.dart';
import 'package:flutter_english_course/models/course/video_course.dart';
import 'package:flutter_english_course/models/user/user.dart';
import 'package:line_icons/line_icons.dart';
import 'package:share_plus/share_plus.dart';

class ProfileView extends StatefulWidget {
  static const String routeName = '/profile';

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late User user;
  final myCourses = <VideoCourse>[];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    user = usersJSON
        .map((e) => User.fromJson(e))
        .firstWhere((element) => element.uid == "qwerty456");
    myCourses
      ..clear()
      ..addAll(videoCoursesJSON.reversed.map((e) => VideoCourse.fromJson(e)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(user: user),
              const SizedBox(height: 20),
              const PremiumCard(),
              LearnedCard(
                currentLearned: 4,
                targetLearned: 23,
                onPressed: () {},
              ),
              MyCourseCard(courses: myCourses),
              const _MenuButton(),
              const ActionButton()
            ],
          )),
    );
  }
}

class MenuButton extends StatefulWidget {
  const MenuButton({super.key});

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  final lightModeNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    lightModeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              child: Text(
                "Other",
                style: p20.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          PhotoAvatar(
            photoUrl: user.profile.avatarURL,
            membership: user.membership,
            progress: user.leveling.progress,
            color: context.theme.primaryColor,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(45.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.7),
                    child: Text(
                      user.profile.fullname,
                      style: p21.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      user.profile.email,
                      style: p14.bold.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Badge(
                  animationType: BadgeAnimationType.scale,
                  animationDuration: const Duration(milliseconds: 200),
                  badgeColor: Colors.red[400]!.withOpacity(0.9),
                  badgeContent: const Text(
                    "7",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  child: const Icon(
                    LineIcons.bell,
                    size: 30,
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class _MenuButton extends StatefulWidget {
  const _MenuButton();

  @override
  State<_MenuButton> createState() => __MenuButtonState();
}

class __MenuButtonState extends State<_MenuButton> {
  final lightModeNotifier = ValueNotifier<bool>(false);
  @override
  void dispose() {
    lightModeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        right: 20,
        left: 20,
      ),
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
              child: Text(
                'Other',
                style: p20.bold,
              ),
            ),
            ItemListCard(
              onpressed: () =>
                  lightModeNotifier.value = !lightModeNotifier.value,
              icon: LineIcons.sunAlt,
              name: "Light Mode",
              iconSize: 27,
              trailing: SizedBox(
                height: 17,
                child: ValueListenableBuilder<bool>(
                  valueListenable: lightModeNotifier,
                  builder: (_, lightmodel, __) {
                    return Switch.adaptive(
                      value: lightmodel,
                      onChanged: (value) {
                        lightModeNotifier.value = value;
                      },
                    );
                  },
                ),
              ),
            ),
            ItemListCard(
              onpressed: () =>
                  Share.share("Please Subscribe with Us : \nhttps://bit.ly/"),
              icon: LineIcons.gift,
              name: "Invite Friends",
            ),
            ItemListCard(
              onpressed: () {},
              icon: LineIcons.userShield,
              name: " User Agreement",
            ),
            ItemListCard(
              onpressed: () {},
              icon: LineIcons.questionCircleAlt,
              name: "Help and FeedBack",
            ),
            ItemListCard(
              onpressed: () {},
              icon: LineIcons.cog,
              name: "Settings",
            )
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 17),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
                onPressed: () async {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 36, vertical: 13),
                    elevation: 0.3,
                    textStyle: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white)),
                icon: const Icon(
                  LineIcons.alternateSignOut,
                  size: 27,
                  color: AppColors.white,
                ),
                label: Text(
                  'Sign Out',
                  style: p21.white,
                )),
          )
        ],
      ),
    );
  }
}
