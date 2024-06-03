import 'dart:math';

import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_english_course/cores/cores.dart';
import 'package:line_icons/line_icons.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class PhotoAvatar extends StatelessWidget {
  const PhotoAvatar({
    super.key,
    required this.photoUrl,
    this.heroTag,
    this.membership,
    this.progress = 0,
    this.color,
    this.isWideProgress = false,
  });

  final String? photoUrl;
  final String? heroTag;

  final String? membership;
  final int? progress;
  final Color? color;
  final bool? isWideProgress;

  Widget emptyPhoto(BuildContext context) {
    return Hero(
      tag: "empty-avatar${heroTag ?? Random().nextInt(100).toString()}",
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 70,
        child: Center(
          child: Icon(
            LineIcons.alternateUser,
            size: 50,
            color: context.theme.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget emptyPhotoBorder(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: context.theme.primaryColor, width: 1)),
      child: Hero(
        tag:
            "empty-avatar-borders${heroTag ?? Random().nextInt(100).toString()}",
        child: CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: 70,
          child: Center(
            child: Icon(
              LineIcons.alternateUser,
              size: 50,
              color: context.theme.colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: isWideProgress!
            ? photoUrl?.isEmpty ?? true
                ? emptyPhotoBorder(context)
                : Hero(
                    tag: "avatar${heroTag ?? Random().nextInt(100).toString()}",
                    child: CachedNetworkImage(
                      imageUrl: photoUrl!,
                      errorWidget: (context, url, error) => const CircleAvatar(
                        maxRadius: 27,
                      ),
                      imageBuilder: (context, imageProvider) {
                        return CircleAvatar(
                          maxRadius: 27,
                          backgroundColor: Colors.white,
                          backgroundImage: imageProvider,
                        );
                      },
                    ))
            : Stack(
                children: [
                  CircularStepProgressIndicator(
                    totalSteps: 100,
                    padding: 0,
                    currentStep: progress!,
                    selectedStepSize: 3.7,
                    width: 65,
                    height: 65,
                    startingAngle: 2.3,
                    selectedColor: color ?? Colors.yellow[600],
                    unselectedColor: Colors.white,
                    roundedCap: (p0, p1) => true,
                    child: Center(
                      child: photoUrl?.isEmpty ?? true
                          ? emptyPhoto(context)
                          : Hero(
                              tag:
                                  "avatar${heroTag ?? Random().nextInt(100).toString()}",
                              child: CachedNetworkImage(
                                imageUrl: photoUrl!,
                                errorWidget: (context, url, error) =>
                                    const CircleAvatar(
                                  maxRadius: 27,
                                ),
                                imageBuilder: (context, imageProvider) {
                                  return CircleAvatar(
                                    maxRadius: 25,
                                    backgroundColor: Colors.white,
                                    backgroundImage: imageProvider,
                                  );
                                },
                              ),
                            ),
                    ),
                  ),
                  Positioned(
                      bottom: 8,
                      right: -2,
                      child: Badge(
                        shape: BadgeShape.square,
                        animationType: BadgeAnimationType.scale,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2.7),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                        badgeColor: color ?? Colors.yellow[600]!,
                        borderRadius: BorderRadius.circular(14),
                        elevation: 0,
                        badgeContent: Text(
                          membership ?? "Free",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 10),
                        ),
                      ))
                ],
              ));
  }
}
