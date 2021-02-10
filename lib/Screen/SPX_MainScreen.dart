import 'package:SpaceX/Models/ContentsScreen.dart';
import 'package:SpaceX/Models/Launch.dart';
import 'package:SpaceX/Models/LaunchSite.dart';
import 'package:SpaceX/Models/Rocket.dart';
import 'package:SpaceX/Resources/Constants.dart';
import 'package:SpaceX/Resources/Widgets.dart';
import 'package:SpaceX/Screen/LaunchesScreen/SPX_LaunchesMainScreen.dart';
import 'package:SpaceX/Screen/RocketsScreen/SPX_RocketsMainScreen.dart';
import 'package:SpaceX/Screen/UpcommingScreen/SPX_UpcommingMainScreen.dart';
import 'package:flutter/material.dart';

final List<LaunchSite> _launchSites = [
  LaunchSite(
      siteCode: "CCAES SLC 40",
      siteFullname: "Cape Canaveral Air Force Station Space Launch Complex 40"),
  LaunchSite(
      siteCode: "AAAES SLC 40",
      siteFullname: "Cape Canaveral Air Force Station Space Launch Complex 40"),
  LaunchSite(
      siteCode: "CCAES SEC 40",
      siteFullname: "Cape Canaveral Air Force Station Space Launch Complex 40"),
  LaunchSite(
      siteCode: "CAAES SLC 40",
      siteFullname: "Cape Canaveral Air Force Station Space Launch Complex 40"),
];

final List<Rocket> _rockets = [
  Rocket(
      name: 'Falcon 1',
      summary: "Falcon 9",
      imgPath: 'assets/images/r1.png',
      isActivated: true),
  Rocket(
    name: 'Starlink 2',
    summary: "Starlink 99",
    imgPath: 'assets/images/r2.png',
    isActivated: false,
  ),
  Rocket(
    name: 'Falcon 7',
    summary: "Falcon 65",
    imgPath: 'assets/images/r3.png',
    isActivated: false,
  ),
  Rocket(
    name: 'Big Falcon',
    summary: "Falcon 12",
    imgPath: 'assets/images/r4.png',
    isActivated: true,
  ),
  Rocket(
    isActivated: true,
    name: 'DemoSat',
    summary: "DemoSat 93",
    imgPath: 'assets/images/r5.png',
  )
];
final List<LaunchRocket> _launches = [
  LaunchRocket(
    youtubeLink: 'https://www.youtube.com/watch?v=fe6HBw1y6bA',
    redditLink:
        'https://www.reddit.com/r/SapceXMasterrace/comments/9fqdeu/sapcex_launches_dargon_to_the_iss_crs12/',
    images: [
      'assets/images/rl1.jpg',
      'assets/images/rl2.jpg',
      'assets/images/rl4.jpg',
    ],
    details: "Last Launch of the original Falcon 1 v1.0 launch vehicle",
    firstStage: "Cores : 4",
    secondStage: "Payloads: 150kg",
    rocket: _rockets[0],
    launchState: true,
    type: "v1.0",
    launchDate: DateTime(2014, 12, 16, 13, 50, 00),
    launchSite: _launchSites[0],
  ),
  LaunchRocket(
    youtubeLink: 'https://www.youtube.com/watch?v=fe6HBw1y6bA',
    redditLink:
        'https://www.reddit.com/r/SapceXMasterrace/comments/9fqdeu/sapcex_launches_dargon_to_the_iss_crs12/',
    images: [
      'assets/images/rl3.jpg',
      'assets/images/rl1.jpg',
      'assets/images/rl2.jpg',
    ],
    details: "Last Launch of the original Falcon 1 v1.0 launch vehicle",
    firstStage: "Cores : 4",
    secondStage: "Payloads: 150kg",
    rocket: _rockets[1],
    launchState: false,
    type: "v1.0",
    launchDate: DateTime(2016, 9, 8, 13, 50, 00),
    launchSite: _launchSites[1],
  ),
  LaunchRocket(
    youtubeLink: 'https://www.youtube.com/watch?v=fe6HBw1y6bA',
    redditLink:
        'https://www.reddit.com/r/SapceXMasterrace/comments/9fqdeu/sapcex_launches_dargon_to_the_iss_crs12/',
    images: [
      'assets/images/rl4.jpg',
      'assets/images/rl3.jpg',
      'assets/images/rl1.jpg',
    ],
    details: "Last Launch of the original Falcon 1 v1.0 launch vehicle",
    firstStage: "Cores : 4",
    secondStage: "Payloads: 150kg",
    rocket: _rockets[2],
    launchState: true,
    type: "v1.0",
    launchDate: DateTime(2019, 11, 24, 11, 50, 00),
    launchSite: _launchSites[2],
  ),
  LaunchRocket(
    youtubeLink: 'https://www.youtube.com/watch?v=fe6HBw1y6bA',
    redditLink:
        'https://www.reddit.com/r/SapceXMasterrace/comments/9fqdeu/sapcex_launches_dargon_to_the_iss_crs12/',
    images: [
      'assets/images/rl2.jpg',
      'assets/images/rl4.jpg',
      'assets/images/rl1.jpg',
    ],
    details: "Last Launch of the original Falcon 1 v1.0 launch vehicle",
    firstStage: "Cores : 4",
    secondStage: "Payloads: 150kg",
    rocket: _rockets[3],
    launchState: false,
    type: "v1.0",
    launchDate: DateTime(2021, 3, 11, 13, 50, 00),
    launchSite: _launchSites[3],
  ),
];

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
//Variable ——————————————————————————————————
  List<LaunchRocket> _upcomingLaunches = [];

  List<ContentsScreen> _contentsScreenList;
  final _borderRadius = Radius.circular(30);
  ContentsScreen _selectedScreen;

  //—————————————————————————————————— Variable

//Functions——————————————————————————————————
  @override
  void initState() {
    super.initState();
    setData();
  }

  setData() {
    _launches.forEach((rl) {
      if (rl.launchDate.isAfter(DateTime.now())) {
        _upcomingLaunches.add(rl);
      }
    });
    _selectedScreen = ContentsScreen(
      title: 'Upcoming',
      screen: UpcommingMainScreen(
        upcommingLaunceRocketList: _upcomingLaunches,
      ),
    );
    _contentsScreenList = [
      ContentsScreen(
        title: 'Upcoming',
        screen: UpcommingMainScreen(
          upcommingLaunceRocketList: _upcomingLaunches,
        ),
      ),
      ContentsScreen(
        title: 'Launches',
        screen: LaunchMainScreen(
          launceRocketList: _launches,
        ),
      ),
      ContentsScreen(
        title: 'Rockets',
        screen: RocketsMainScreen(
          rockets: _rockets,
        ),
      )
    ];
  }

  onButtonTap(ContentsScreen contentsScreen) {
    setState(() {
      _selectedScreen = contentsScreen;
    });
  }

  buildSearchButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        child: Icon(
          Icons.search,
          color: COLOR_APPBAR_CONTENTS,
        ),
      ),
    );
  }

  buildAppbar() {
    return AppBar(
      leading: Icon(Icons.format_list_bulleted_sharp),
      backgroundColor: COLOR_APPBAR_BACKGROUND,
      title: Text(
        'SpaceX',
        style: TextStyle(color: COLOR_APPBAR_CONTENTS),
      ),
      actions: [
        buildSearchButton(),
      ],
    );
  }

  buildContentsButton() {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _contentsScreenList
              .map(
                (contentsScreen) => ContentButton(
                  onTap: () => onButtonTap(contentsScreen),
                  contentsScreen: contentsScreen,
                  isSelected: _selectedScreen.title == contentsScreen.title,
                ),
              )
              .toList()),
    );
  }

  buildBody() {
    return Container(
      margin: EdgeInsets.only(top: 40.0),
      decoration: BoxDecoration(
        color: COLOR_BACKGROUND,
        borderRadius: BorderRadius.only(
          topRight: _borderRadius,
          topLeft: _borderRadius,
        ),
      ),
      child: Column(
        children: [
          buildContentsButton(),
          Expanded(child: _selectedScreen.screen)
        ],
      ),
    );
  }

//——————————————————————————————————Functions

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_APPBAR_BACKGROUND,
      appBar: buildAppbar(),
      body: buildBody(),
    );
  }
}
