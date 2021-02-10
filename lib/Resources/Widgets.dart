import 'package:SpaceX/Models/ContentsScreen.dart';
import 'package:SpaceX/Resources/Functions.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class ContentButton extends StatelessWidget {
  final ContentsScreen contentsScreen;
  final Function onTap;
  final bool isSelected;
  const ContentButton({
    Key key,
    @required this.onTap,
    @required this.isSelected,
    @required this.contentsScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              child: Text(
                contentsScreen.title,
                style: TextStyle(
                  color: isSelected ? Colors.red : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          isSelected
              ? Container(
                  height: getMQHeight(context) * 0.004,
                  width: getMQWidth(context) * 0.13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.red,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}

class ActivationBox extends StatelessWidget {
  final bool isActicated;
  const ActivationBox({
    Key key,
    @required this.isActicated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getMQWidth(context) * 0.16,
      decoration: BoxDecoration(
        color: isActicated ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: Text(
            isActicated ? "ACTIVE" : "INACTIVE",
            style: TextStyle(color: Colors.white, fontSize: 8),
          ),
        ),
      ),
    );
  }
}

class DetailedInformationFormat extends StatelessWidget {
  final String title;
  final String desc;
  final bool isDescBold;
  final Widget button;
  final bool isAlignmentEnd;
  final Color textColor;
  const DetailedInformationFormat({
    Key key,
    this.textColor = Colors.white,
    this.isAlignmentEnd = false,
    @required this.title,
    @required this.desc,
    this.isDescBold = false,
    this.button,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            isAlignmentEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(color: Colors.red, fontSize: 10),
          ),
          SizedBox(
            height: 10,
          ),
          button ??
              Text(
                desc,
                style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight:
                        isDescBold ? FontWeight.bold : FontWeight.normal),
              )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String linkUrl;
  final IconData icon;
  final Color color;
  const CustomButton({
    Key key,
    @required this.color,
    @required this.icon,
    @required this.linkUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (await UrlLauncher.canLaunch(linkUrl)) {
          await UrlLauncher.launch(linkUrl);
        } else {
          throw 'Could not launch $linkUrl';
        }
      },
      child: Container(
        width: getMQWidth(context) * 0.3,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CustomImageBox extends StatelessWidget {
  final String imgPath;
  const CustomImageBox({
    Key key,
    @required this.imgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: getMQHeight(context) * 0.35,
      width: getMQWidth(context) * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imgPath),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
