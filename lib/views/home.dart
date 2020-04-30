import 'dart:developer';

import 'package:covid19/data/network.dart';
import 'package:covid19/model/country.dart';
import 'package:covid19/model/summary.dart';
import 'package:covid19/views/all_country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  NetworkHelper networkHelper = new NetworkHelper();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            FutureBuilder(
                builder: (context, snapData) {
                  if (snapData.hasData) {
                    Summary summary = snapData.data;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FaIcon(FontAwesomeIcons.virus),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Global",
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Total cases",
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(fontSize: 17)),
                                ),
                                Text(summary.cases.toString(),
                                  style: GoogleFonts.oswald(
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          color: Colors.amber,
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
                                          color: Colors.red,
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
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
                future: networkHelper.getSummary()),
            FutureBuilder(
                builder: (context, snapData) {
                  if (snapData.hasData) {
                    Country summary = snapData.data;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FaIcon(FontAwesomeIcons.virus),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Bangladesh",
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
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
                                              color: Colors.amber,
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
                                              color: Colors.green,
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
                                              color: Colors.yellow,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
                future: networkHelper.getBangladeshInfo()),
          ],
        ),
      ),
    );
  }
}
