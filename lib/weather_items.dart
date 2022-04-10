import 'package:flutter/material.dart';

class WeatherItems extends StatelessWidget {
  final dynamic item;

  WeatherItems({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(

        child: Card(
            color: Colors.black45,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  CircleAvatar(
                    //images/
                    backgroundImage: AssetImage(
                        "assets/images/${item['weather_state_abbr']}.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${item["applicable_date"]}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${(item['wind_speed']).round()} wind speed"
                            " | ${item['weather_state_name']}",
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    "${(item['the_temp']).round()} °C",
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ]))));
  }
}

