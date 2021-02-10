import 'package:SpaceX/Models/LaunchSite.dart';
import 'package:SpaceX/Models/Rocket.dart';
import 'package:flutter/material.dart';

class LaunchRocket {
  LaunchRocket({
    @required this.details,
    @required this.firstStage,
    @required this.images,
    @required this.launchDate,
    @required this.launchState,
    @required this.redditLink,
    @required this.rocket,
    @required this.secondStage,
    @required this.type,
    @required this.youtubeLink,
    @required this.launchSite,
  });
  final LaunchSite launchSite;
  final Rocket rocket;
  final DateTime launchDate;
  final bool launchState;
  final String details;
  final String type;
  final String firstStage;
  final String secondStage;
  final String youtubeLink;
  final String redditLink;
  final List<String> images;
}
