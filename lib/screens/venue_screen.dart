import 'package:flutter/material.dart';
import 'package:t20_app/utility/data_handler.dart';

import '../models/venues_model.dart';

class VenueScreen extends StatefulWidget {
  const VenueScreen({Key? key}) : super(key: key);

  @override
  State<VenueScreen> createState() => _VenueScreenState();
}

class _VenueScreenState extends State<VenueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Stadiums'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FutureBuilder<List<VenueModel>>(
          future: DataHandler.getAllVenueData(context),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasData)
              {
                List<VenueModel> myVenue = snapshot.data;
                return ListView.builder(
                  itemCount: myVenue.length,
                  itemBuilder: (BuildContext context, int index){
                    VenueModel venueData = myVenue[index];
                    return Container(
                      width: double.infinity,
                      height: 300,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: 5,),
                          Text('Country:${venueData.country}', style: TextStyle(color: Colors.black, fontSize: 20),),
                          Text('City: ${venueData.city}', style: TextStyle(color: Colors.black, fontSize: 22),),
                          Text(venueData.stadium, style: TextStyle(color: Colors.black, fontSize: 20),),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(venueData.image, width: double.infinity, height: 170, fit: BoxFit.cover,)),
                        ],
                      ),
                    );
                  },
                );
              }
            else
              {
                return const Center(child: CircularProgressIndicator(),);
              }
          },
        ),
      ),
    );
  }
}