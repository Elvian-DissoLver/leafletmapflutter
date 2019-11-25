import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:map_app/model/Quran.dart';
import 'package:map_app/scoped_models/AppModel.dart';
import 'package:map_app/widgets/waqif/IconQuranMark.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:latlong/latlong.dart';


class WaqifQuranItem extends StatelessWidget {

  WaqifQuranItem(this.quranData);

  final List<Quran> quranData;

  Widget _buildMarkersView(AppModel model) {
    return Stack(
      children: <Widget>[
        new FlutterMap(
            options: new MapOptions(
                maxZoom: 17.0 , minZoom: 5.0, center: new LatLng(-6.1750, 106.8266)),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                  'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c']),
              new MarkerLayerOptions(
                  markers: listMarker(),
              )
            ])
      ],
    );
  }

  List<Marker> listMarker() {

    List<Marker> mark = new List();

    quranData.forEach((f) {
        mark.add(
            Marker(
                width: 45.0,
                height: 45.0,
                point: new LatLng(f.latitude, f.longitude),
                builder: (context) => new Container(
                  child: IconQuranMark(
                      icon: (FontAwesomeIcons.quran),
                      onTap: () {
                        print('Marker tapped!');
                      }),
                ))
        );
    });

    return mark;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (BuildContext context, Widget child, AppModel model) {
          Widget waqifQuranItem = _buildMarkersView(model);

          return waqifQuranItem;
        }
    );
  }
}

