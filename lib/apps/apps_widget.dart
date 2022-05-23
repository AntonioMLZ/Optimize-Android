import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../load/load_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AppsWidget extends StatefulWidget {
  const AppsWidget({Key key}) : super(key: key);

  @override
  _AppsWidgetState createState() => _AppsWidgetState();
}

class _AppsWidgetState extends State<AppsWidget> with TickerProviderStateMixin {
  final animationsMap = {
    'iconButtonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Apps'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: StreamBuilder<List<Pages2Record>>(
          stream: queryPages2Record(
            singleRecord: true,
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: SpinKitFadingCube(
                    color: FlutterFlowTheme.of(context).primaryColor,
                    size: 50,
                  ),
                ),
              );
            }
            List<Pages2Record> textPages2RecordList = snapshot.data;
            // Return an empty Container when the document does not exist.
            if (snapshot.data.isEmpty) {
              return Container();
            }
            final textPages2Record = textPages2RecordList.isNotEmpty
                ? textPages2RecordList.first
                : null;
            return Text(
              textPages2Record.pageName,
              style: FlutterFlowTheme.of(context).title1,
            );
          },
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).darkBG,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 53,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).darkBG,
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: Image.asset(
                        'assets/images/waves@2x.png',
                      ).image,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                child: StreamBuilder<List<AppsRecord>>(
                  stream: queryAppsRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: SpinKitFadingCube(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 50,
                          ),
                        ),
                      );
                    }
                    List<AppsRecord> listViewAppsRecordList = snapshot.data;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewAppsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewAppsRecord =
                            listViewAppsRecordList[listViewIndex];
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0x00FEFEFE),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Color(0x410C0909),
                                offset: Offset(0, 1),
                              )
                            ],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 1, 1, 1),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      listViewAppsRecord.linkImage,
                                      width: 70,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 8, 4, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          listViewAppsRecord.name,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 8, 0),
                                            child: AutoSizeText(
                                              listViewAppsRecord
                                                  .descripcionCorta
                                                  .maybeHandleOverflow(
                                                maxChars: 70,
                                                replacement: '…',
                                              ),
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Color(0x00FEFEFE),
                                        borderRadius: 30,
                                        borderWidth: 1,
                                        buttonSize: 60,
                                        fillColor: Color(0x00FEFEFE),
                                        icon: Icon(
                                          Icons.cloud_download,
                                          color: Color(0xFFE4E4E4),
                                          size: 30,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent('IconButton_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_Navigate-To');
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => LoadWidget(
                                                name: listViewAppsRecord.name,
                                                linkd: listViewAppsRecord
                                                    .linkDescargar,
                                                img: listViewAppsRecord
                                                    .linkImage,
                                                shotdescripcion:
                                                    listViewAppsRecord
                                                        .descripcionCorta,
                                                descripcion: listViewAppsRecord
                                                    .descripcionLarga,
                                                autor: listViewAppsRecord
                                                    .nombreDelFabricante,
                                              ),
                                            ),
                                          );
                                        },
                                      ).animated([
                                        animationsMap[
                                            'iconButtonOnPageLoadAnimation']
                                      ]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
