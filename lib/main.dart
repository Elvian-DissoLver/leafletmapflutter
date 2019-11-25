import 'package:flutter/material.dart';
import 'package:map_app/pages/waqif/QuranTrack.dart';
import 'package:map_app/scoped_models/AppModel.dart';
import 'package:scoped_model/scoped_model.dart';

void main() async => runApp(BWATrack());

class BWATrack extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BWATrackState();
  }
}

class _BWATrackState extends State<BWATrack> {

  AppModel _model;
  @override
  void initState() {
    _model = AppModel();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModel<AppModel>(
      model: _model,
      child: MaterialApp(
        title: 'BWA Track',

        routes: {
          '/': (BuildContext context) => QuranTrack(),
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) =>
                QuranTrack(),
          );
        },
      ),
    );
  }
}