import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_app/model/Quran.dart';
import 'package:map_app/scoped_models/AppModel.dart';
import 'package:map_app/widgets/waqif/WaqifQuranMark.dart';
import 'package:scoped_model/scoped_model.dart';

class QuranTrack extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _QuranTrackState();
  }
}

class _QuranTrackState extends State<QuranTrack> {

  List<Quran> quran = [];

  @override
  void initState() {
    setState(() {
      quran = [
        Quran(
          id: 0,
          waqifName: 'Iman',
          latitude: -6.1600,
          longitude:  106.8266
        ),
        Quran(
          id: 0,
          waqifName: 'Akel',
          latitude: -6.1700,
          longitude:  106.8266
        )
      ];
    });

    super.initState();
  }


  Widget _buildAppBar(AppModel model) {
    return AppBar(
      title: Text(
        'BWA Track',
      ),
    );
  }

  Widget _buildPageContent(AppModel model) {
    return Scaffold(
      appBar: _buildAppBar(model),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: WaqifQuranItem(quran),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<AppModel>(
      builder: (BuildContext context, Widget child, AppModel model) {
        Stack stack = Stack(
          children: <Widget>[
            _buildPageContent(model),
          ],
        );

        return stack;
      },
    );
  }

}