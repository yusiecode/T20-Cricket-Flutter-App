import 'package:flutter/material.dart';
import 'package:t20_app/screens/history_screen.dart';
import 'package:t20_app/screens/home_screen.dart';
import 'package:t20_app/screens/schedule_screen.dart';
import 'package:t20_app/screens/team_screen.dart';
import 'package:t20_app/screens/venue_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.deepPurple.withOpacity(0.8),
      shadowColor: Colors.black,
      child: ListView(
        children: [
          SizedBox(
            height: 220,
            child: DrawerHeader(
              decoration:  const BoxDecoration(
                  gradient: LinearGradient(
                  colors: [Colors.purple, Colors.deepPurple],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  [
                  Image.asset('assets/images/cup.png', width: 150, height: 150,),
                  const Text(
                    'T20 World Cup',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home,color: Colors.white, size: 35,),
            title: const Text('Home',style: TextStyle(color: Colors.white, fontSize: 20),),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return const HomeScreen();
              }));
            },
          ),
          ListTile(
            leading: const Icon(Icons.schedule,color: Colors.white, size: 35,),
            title: const Text('Schedule',style: TextStyle(color: Colors.white, fontSize: 20),),
            onTap: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context){
               return const ScheduleScreen();
             }));
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on,color: Colors.white, size: 35,),
            title: const Text('Venues',style: TextStyle(color: Colors.white, fontSize: 20),),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return const VenueScreen();
              }));
            },
          ),
          ListTile(
            leading: const Icon(Icons.history,color: Colors.white, size: 35,),
            title: const Text('History',style: TextStyle(color: Colors.white, fontSize: 20),),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return const HistoryScreen();
              }));
            },
          ),
          ListTile(
            leading: const Icon(Icons.group,color: Colors.white, size: 35,),
            title: const Text('Teams',style: TextStyle(color: Colors.white, fontSize: 20),),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return const TeamScreen();
              }));
            },
          ),
          const Divider(thickness: 2, color: Colors.white,),
          ListTile(
            leading: const Icon(Icons.star,color: Colors.white, size: 35,),
            title: const Text('Rate Us',style: TextStyle(color: Colors.white, fontSize: 20),),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}