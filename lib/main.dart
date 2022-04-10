import 'package:flutter/material.dart';
import 'package:weatherstatus/api_manager.dart';
import 'package:weatherstatus/weather_items.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    title: 'Weather Status',
    home: Main(),
  ));
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  Future<dynamic>? _value;
  final ApiManager _apiManager = ApiManager();

  @override
  void initState() {
    _value = _apiManager.getlocationInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar:AppBar(
            elevation: 0,
            backgroundColor: Colors.white38,
            title: Text('Wheathr of Aleppo',
              style: TextStyle(color: Colors.black),
            ),centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _value = _apiManager.getlocationInformation();
                  });
                },
                icon: Icon(Icons.refresh),color: Colors.black87,
              ),
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage( "assets/images/imagegif0.gif"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
                child: FutureBuilder(
              future: _value,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return _checkData(snapshot);
              },
            )),
          ),
        );
  }

  Widget _checkData(AsyncSnapshot<dynamic> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }

    if (!snapshot.hasData) {
      return Text('No Data Found... ');
    }
    List<Widget> days = [];
    for (int i = 0;
        i < snapshot.data.data['consolidated_weather'].length;
        i++) {
      days.add(WeatherItems(
        item: snapshot.data.data['consolidated_weather'][i],
      ));
    }
    return ListView(children: days);
  }
}
//
//
// decoration: BoxDecoration(
// image: DecorationImage(
// image: AssetImage("assets/images/imagegif.gif"), fit: BoxFit.cover)),