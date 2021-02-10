import 'package:SpaceX/Models/Rocket.dart';
import 'package:SpaceX/Resources/Constants.dart';
import 'package:SpaceX/Resources/Functions.dart';
import 'package:SpaceX/Resources/Widgets.dart';
import 'package:flutter/material.dart';

class RocketBox extends StatelessWidget {
  final Rocket rocket;
  const RocketBox({
    Key key,
    @required this.rocket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _infoDistance = 8.0;
    return Container(
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
                    image: DecorationImage(image: AssetImage(rocket.imgPath))),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ROCKET',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: _infoDistance,
                  ),
                  Text(
                    rocket.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: _infoDistance,
                  ),
                  ActivationBox(
                    isActicated: rocket.isActivated,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
