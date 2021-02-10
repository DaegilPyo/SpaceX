import 'package:SpaceX/Models/Launch.dart';
import 'package:SpaceX/Resources/Constants.dart';
import 'package:SpaceX/Resources/Functions.dart';
import 'package:SpaceX/Screen/LaunchesScreen/SPX_DetailedLaunchBox.dart';
import 'package:flutter/material.dart';

class LaunchBox extends StatelessWidget {
  final LaunchRocket launchRocket;
  const LaunchBox({
    @required this.launchRocket,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _infoDistance = 8.0;
    return InkWell(
      onTap: () => materialPageRoute(
          context: context,
          destination: DetailedLaunchScreen(launchRocket: launchRocket)),
      child: Container(
          height: getMQHeight(context) * 0.18,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            boxShadow: [customBoxShadow],
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(launchRocket.rocket.imgPath))),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'LAUNCH',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      height: _infoDistance,
                    ),
                    Text(
                      launchRocket.rocket.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: _infoDistance,
                    ),
                    Text(
                      launchRocket.launchSite.siteCode,
                      style: TextStyle(fontSize: 10),
                    ),
                    SizedBox(
                      height: _infoDistance,
                    ),
                    Text(
                      getShortDateFormat(date: launchRocket.launchDate),
                      style: TextStyle(fontSize: 10),
                    ),
                    SizedBox(
                      height: _infoDistance,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
