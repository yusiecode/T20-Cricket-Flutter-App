import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:t20_app/models/schedule_model.dart';
import 'package:t20_app/models/teams_model.dart';
import 'package:t20_app/models/venues_model.dart';

import '../models/history_model.dart';

class DataHandler
{
  static Future<List<ScheduleModel>> getAllScheduleData(BuildContext context)
  async{
    var matchList = <ScheduleModel>[];

    var defaultAssetBundle = DefaultAssetBundle.of(context);
    var data = await defaultAssetBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode(data.toString());
    var scheduleData = jsonData['schedule'];

    for(var schedulePick in scheduleData)
      {
        ScheduleModel scheduleModel = ScheduleModel.fromJSON(schedulePick);
        matchList.add(scheduleModel);
      }

    return matchList;
  }

  static Future<List<VenueModel>> getAllVenueData(BuildContext context)
  async{
    var venueList = <VenueModel>[];

    var defaultAssetBundle = DefaultAssetBundle.of(context);
    var data = await defaultAssetBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode(data.toString());
    var venueData = jsonData['venues'];

    for(var venueDataPick in venueData)
    {
      VenueModel venueModel = VenueModel.fromJSON(venueDataPick);
      venueList.add(venueModel);
    }

    return venueList;
  }

  static Future<List<TeamModel>> getAllTeams(BuildContext context)
  async{
    var teamList = <TeamModel>[];
    var defaultAssetBundle = DefaultAssetBundle.of(context);
    var data = await defaultAssetBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode(data.toString());
    var teamData = jsonData['teams'];

    for(var teamDataPick in teamData)
    {
      TeamModel teamModel = TeamModel.fromJSON(teamDataPick);
      teamList.add(teamModel);
    }
    return teamList;
  }

  static Future<List<HistoryModel>> getAllHistoryData(BuildContext context)
  async{
    var historyList = <HistoryModel>[];
    var defaultAssetBundle = DefaultAssetBundle.of(context);
    var data = await defaultAssetBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode(data);
    var historyData = jsonData['history'];

    for(var historyPicking in historyData)
      {
        HistoryModel historyModel = HistoryModel.fromJSON(historyPicking);
        historyList.add(historyModel);
      }
    return historyList;
  }
}