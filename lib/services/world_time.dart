import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the UI
  String time; //the time in that location
  String flag; //url to an asset flag icon
  String url; //location url for API endpoint
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

//here future <void> will give a kind of promise that our function will return some
//data and save us from the error
  Future<void> getTime() async {
    try {
//make the request
      Response response =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['utc_datetime'];
      String hourOffset = data['utc_offset'].substring(1, 3);
      String minOffset = data['utc_offset'].substring(4, 6);

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      //updatig the time or now variable every time
      now = now.add(Duration(
          hours: int.parse(hourOffset), minutes: int.parse(minOffset)));

      //set the time property

      isDayTime = now.hour > 7 && now.hour < 17 ? true : false;

      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error $e');
      time = 'could not get time data';
    }
  }
}
