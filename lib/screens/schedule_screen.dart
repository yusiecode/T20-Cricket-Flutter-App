import 'package:flutter/material.dart';
import 'package:t20_app/utility/data_handler.dart';

import '../models/schedule_model.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Schedule'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FutureBuilder<List<ScheduleModel>>(
          future: DataHandler.getAllScheduleData(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<ScheduleModel> myMatch = snapshot.data;
              return ListView.builder(
                itemCount: myMatch.length,
                itemBuilder: (BuildContext context, index) {
                  ScheduleModel matchData = snapshot.data[index];
                  return Container(
                    height: 250,
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                        colors: [Colors.purple, Colors.deepPurple],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 1,),
                        Text(
                          matchData.date,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 22),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/flags/${matchData.flagOne}',
                                      width: 120,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    )),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  matchData.teamOne,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ],
                            ),
                            const Text(
                              'VS',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            Row(
                              children: [
                                Text(
                                  matchData.teamTwo,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                                const SizedBox(width: 5),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/flags/${matchData.flagTwo}',
                                      width: 120,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    )),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          matchData.venue,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 17),
                        ),
                        Container(
                          width: 95,
                          height: 55,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16),
                                topLeft: Radius.circular(16)),
                          ),
                          child: Center(
                              child: Text(
                            'Group ${matchData.group}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 17),
                          )),
                        ),
                      ],
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