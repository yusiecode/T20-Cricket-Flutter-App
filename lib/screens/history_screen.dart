import 'package:flutter/material.dart';
import 'package:t20_app/models/history_model.dart';
import 'package:t20_app/utility/data_handler.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previous History'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FutureBuilder<List<HistoryModel>>(
          future: DataHandler.getAllHistoryData(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<HistoryModel> myHistory = snapshot.data;
              return ListView.builder(
                itemCount: myHistory.length,
                itemBuilder: (BuildContext context, int index) {
                  HistoryModel historyData = snapshot.data[index];
                  return Container(
                    width: double.infinity,
                    height: 200,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.purple, Colors.deepPurple],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Hosted By ${historyData.host} (${historyData.year})',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 22),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              'Winner',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22),
                            ),
                            Text(
                              'RunnerUp',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                      'assets/flags/${historyData.winnerFlag}',
                                      width: 70,
                                      height: 45,
                                      fit: BoxFit.cover),
                                ),
                                const SizedBox(width: 5,),
                                Text(
                                  historyData.winner,
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
                                  historyData.runnerUp,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                                const SizedBox(width: 5,),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                      'assets/flags/${historyData.runnerUpFlag}',
                                      width: 70,
                                      height: 45,
                                      fit: BoxFit.cover),
                                ),
                              ],
                            ),
                          ],
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