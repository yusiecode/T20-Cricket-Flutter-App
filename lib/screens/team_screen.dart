import 'package:flutter/material.dart';
import 'package:t20_app/models/teams_model.dart';
import 'package:t20_app/utility/data_handler.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Teams'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<TeamModel>>(
          future: DataHandler.getAllTeams(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<TeamModel> teamModel = snapshot.data;
              return ListView.builder(
                itemCount: teamModel.length,
                itemBuilder: (BuildContext context, int index) {
                  TeamModel teamData = teamModel[index];
                  return Container(
                    width: double.infinity,
                    height: 120,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.purple, Colors.deepPurple],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(

                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                teamData.flag,
                                width: 110,
                                height: 80,
                                fit: BoxFit.cover,
                              )),
                         const SizedBox(width: 10,),
                          Text(
                            teamData.fullName,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}