import 'package:flutter/material.dart';
import 'package:t20_app/screens/history_screen.dart';
import 'package:t20_app/screens/schedule_screen.dart';
import 'package:t20_app/screens/team_screen.dart';
import 'package:t20_app/screens/venue_screen.dart';
import 'package:t20_app/widgets/check_net.dart';
import 'package:t20_app/widgets/home_screen_item.dart';
import 'package:t20_app/widgets/my_drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('T20 Cricket World Cup'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      drawer: const MyDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
              'assets/images/backg.jpg',
            ),
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.5),
              BlendMode.modulate,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            children: [
              HomeScreenItem(
                  icon: Icons.access_alarm,
                  text: 'Schedule',
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const ScheduleScreen();
                    }));
                  }),
              HomeScreenItem(
                  icon: Icons.location_on,
                  text: 'Venues',
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const VenueScreen();
                    }));
                  }),
              HomeScreenItem(
                  icon: Icons.history,
                  text: 'History',
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const HistoryScreen();
                    }));
                  }),
              HomeScreenItem(
                  icon: Icons.group,
                  text: 'Teams',
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const TeamScreen();
                    }));
                  }),
              HomeScreenItem(
                  icon: Icons.live_tv,
                  text: 'LiveScore',
                  onPressed: () async {
                    var url = 'https://www.t20worldcup.com/';
                    if (await CheckNet.isConnectedNet()) {
                      if (!await launchUrl(Uri.parse(url))) {
                        throw 'Could not launch $url';
                      }
                    } else {
                      Fluttertoast.showToast(
                        msg: 'Please Check Your Internet',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        fontSize: 17.0,
                      );
                    }
                  }),
              HomeScreenItem(
                  icon: Icons.video_call,
                  text: 'Highlights',
                  onPressed: () async {
                    var url = 'https://2022.t20worldcup.com/video/2908990';
                    if (await CheckNet.isConnectedNet()) {
                      if (!await launchUrl(Uri.parse(url))) {
                        throw 'Could not launch $url';
                      }
                    } else {
                      Fluttertoast.showToast(
                          msg: 'Please Check Your Internet',
                          fontSize: 17.0,
                          textColor: Colors.black,
                          backgroundColor: Colors.white);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}