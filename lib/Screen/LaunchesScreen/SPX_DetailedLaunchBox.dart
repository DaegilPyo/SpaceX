import 'package:SpaceX/Models/Launch.dart';
import 'package:SpaceX/Resources/Constants.dart';
import 'package:SpaceX/Resources/Functions.dart';
import 'package:SpaceX/Resources/Widgets.dart';
import 'package:flutter/material.dart';

class DetailedLaunchScreen extends StatelessWidget {
  final LaunchRocket launchRocket;
  const DetailedLaunchScreen({Key key, @required this.launchRocket})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    buildRocketLogo() {
      return Container(
        height: getMQHeight(context) * 0.1,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(launchRocket.rocket.imgPath))),
      );
    }

    buildStage() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DetailedInformationFormat(
              title: "first Statge", desc: launchRocket.firstStage),
          DetailedInformationFormat(
              title: "second Statge", desc: launchRocket.secondStage),
        ],
      );
    }

    buildButtons() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DetailedInformationFormat(
            title: "youtube",
            desc: '',
            button: CustomButton(
              color: Colors.red,
              icon: Icons.play_arrow,
              linkUrl: launchRocket.youtubeLink,
            ),
          ),
          DetailedInformationFormat(
            title: "reddit",
            desc: '',
            button: CustomButton(
              color: Colors.orange,
              icon: Icons.sentiment_very_satisfied_outlined,
              linkUrl: launchRocket.redditLink,
            ),
            isAlignmentEnd: true,
          ),
        ],
      );
    }

    buildImages() {
      return Container(
        height: getMQHeight(context) * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: launchRocket.images
                        .map((img) => CustomImageBox(
                              imgPath: img,
                            ))
                        .toList())),
          ],
        ),
      );
    }

    buildDetailedInfo() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailedInformationFormat(
            title: "rocket",
            desc: launchRocket.rocket.name,
            isDescBold: true,
          ),
          DetailedInformationFormat(
            title: "launch date",
            desc: getShortDateFormat(date: launchRocket.launchDate),
          ),
          DetailedInformationFormat(
            title: "launch site",
            desc: launchRocket.launchSite.siteCode,
          ),
          DetailedInformationFormat(
            title: "launch status",
            desc: launchRocket.launchState ? "Success" : "Failed",
          ),
          DetailedInformationFormat(
            title: "details",
            desc: launchRocket.details,
          ),
          DetailedInformationFormat(
            title: "rocket summary",
            desc: launchRocket.rocket.summary,
          ),
          DetailedInformationFormat(
            title: "type",
            desc: launchRocket.type,
          ),
          buildStage(),
          buildButtons(),
          DetailedInformationFormat(title: 'sneak peak', desc: ''),
          buildImages(),
        ],
      );
    }

    buildBody() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        child: ListView(
          children: [
            buildRocketLogo(),
            buildDetailedInfo(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: COLOR_APPBAR_BACKGROUND,
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context), child: Icon(Icons.arrow_back)),
        backgroundColor: COLOR_APPBAR_BACKGROUND,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.swap_calls_outlined),
          )
        ],
      ),
      body: buildBody(),
    );
  }
}
