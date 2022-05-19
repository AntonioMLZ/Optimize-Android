import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AppsRecomendadasWidget extends StatefulWidget {
  const AppsRecomendadasWidget({Key key}) : super(key: key);

  @override
  _AppsRecomendadasWidgetState createState() => _AppsRecomendadasWidgetState();
}

class _AppsRecomendadasWidgetState extends State<AppsRecomendadasWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Aplicaciones Recomendadas',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: SafeArea(
        child: StreamBuilder<List<AppsRecomendadasRecord>>(
          stream: queryAppsRecomendadasRecord(
            queryBuilder: (appsRecomendadasRecord) =>
                appsRecomendadasRecord.where('Name', arrayContains: ''),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: SpinKitFadingCube(
                    color: Color(0xFF5917ED),
                    size: 50,
                  ),
                ),
              );
            }
            List<AppsRecomendadasRecord> listViewAppsRecomendadasRecordList =
                snapshot.data;
            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: listViewAppsRecomendadasRecordList.length,
              itemBuilder: (context, listViewIndex) {
                final listViewAppsRecomendadasRecord =
                    listViewAppsRecomendadasRecordList[listViewIndex];
                return Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: FutureBuilder<List<AppsRecomendadasRecord>>(
                    future: queryAppsRecomendadasRecordOnce(
                      queryBuilder: (appsRecomendadasRecord) =>
                          appsRecomendadasRecord.where('Name',
                              arrayContains: listViewAppsRecomendadasRecord.name
                                  .toList()
                                  .length
                                  .toString()),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: SpinKitFadingCube(
                              color: Color(0xFF5917ED),
                              size: 50,
                            ),
                          ),
                        );
                      }
                      List<AppsRecomendadasRecord>
                          textAppsRecomendadasRecordList = snapshot.data;
                      return Text(
                        'Hello World',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
