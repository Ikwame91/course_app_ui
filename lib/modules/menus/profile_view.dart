import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_english_course/components/cards/premium_card.dart';
import 'package:flutter_english_course/components/common/photo_avatar.dart';
import 'package:flutter_english_course/components/components.dart';
import 'package:flutter_english_course/cores/cores.dart';
import 'package:flutter_english_course/dummies/users_dummy.dart';
import 'package:flutter_english_course/models/user/user.dart';
import 'package:line_icons/line_icons.dart';

class ProfileView extends StatefulWidget {
  static const String routeName = '/profile';

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late User user;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    user = usersJSON
        .map((e) => User.fromJson(e))
        .firstWhere((element) => element.uid == "qwerty123");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfileHeader(user: user),
              const SizedBox(height: 20),
              const PremiumCard(),
              LearnedCard(
                currentLearned: 4,
                targetLearned: 23,
                onPressed: () {},
              )
            ],
          )),
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
              padding: const EdgeInsets.all(18.0),
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
