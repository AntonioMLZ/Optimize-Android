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
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF1F4F8),
    );
  }
}
