import 'package:flutter/material.dart';
import '../screens/global_statistics.dart';
import '../screens/global_loading.dart';
import '../services/covid_service.dart';
import '../models/global_summary.dart';

CovidService covidService = CovidService();

class Global extends StatefulWidget {
  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<Global> {

  Future<GlobalSummaryModel> summary;

  @override
  void initState() {
    super.initState();
    summary = covidService.getGlobalSummary();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Text(
                  "Global Cases",
                  style: TextStyle(
                    color: Color(0xffC8D5B9),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      summary = covidService.getGlobalSummary();
                    });
                  },
                  child: Icon(
                    Icons.refresh,
                    color: Color(0xffC8D5B9),
                  ),
                ),

              ],
            ),
          ),

          FutureBuilder(
            future: summary,
            builder: (context, snapshot) {
              if (snapshot.hasError)
                return Center(child: Text("Error"),);
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return GlobalLoading();
                default:
                  return !snapshot.hasData
                    ? Center(child: Text("Empty"),)
                    : GlobalStatistics(
                      summary: snapshot.data,
                    );
              }
            },
          ),
        ],
      ),
    );
  }
}