import 'package:covid19/data/network.dart';
import 'package:covid19/model/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AllCountryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AllCountryPage();
  }
}

class _AllCountryPage extends State<AllCountryPage> {
  NetworkHelper networkHelper = new NetworkHelper();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: networkHelper.getAllCountryInfo(),
            builder: (context, snapData) {
              if (snapData.hasData) {
                List<Country> list = snapData.data;
                return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      Country summary = list[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "${summary.country}",
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Total cases",
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(fontSize: 17)),
                                          ),
                                          Text(
                                            summary.cases.toString(),
                                            style: GoogleFonts.oswald(
                                                textStyle: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.yellow,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                          Text(
                                            "Total deaths",
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(fontSize: 17)),
                                          ),
                                          Text(
                                            summary.deaths.toString(),
                                            style: GoogleFonts.oswald(
                                                textStyle: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                          Text(
                                            "Total recovered",
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(fontSize: 17)),
                                          ),
                                          Text(
                                            summary.recovered.toString(),
                                            style: GoogleFonts.oswald(
                                                textStyle: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            "Today cases",
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(fontSize: 17)),
                                          ),
                                          Text(
                                            summary.todayCases.toString(),
                                            style: GoogleFonts.oswald(
                                                textStyle: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                          Text(
                                            "Today deaths",
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(fontSize: 17)),
                                          ),
                                          Text(
                                            summary.todayDeaths.toString(),
                                            style: GoogleFonts.oswald(
                                                textStyle: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                          Text(
                                            "Total tests",
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(fontSize: 17)),
                                          ),
                                          Text(
                                            summary.totalTests.toString(),
                                            style: GoogleFonts.oswald(
                                                textStyle: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
