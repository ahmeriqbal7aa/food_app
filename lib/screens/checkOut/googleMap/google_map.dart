import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/providers/check_out_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class CustomGoogleMap extends StatefulWidget {
  @override
  _GoogleMapState createState() => _GoogleMapState();
}

class _GoogleMapState extends State<CustomGoogleMap> {
  /// Obj of CheckOutProvider Class
  CheckOutProvider checkOutProvider;

  /// initial value mean in map we need how many percentage
  /// PK country area => (30.3753, 69.3451)
  LatLng _initialCameraPosition = LatLng(30.3753, 69.3451);

  /// Google Map Controller
  GoogleMapController controller;

  /// Location Variable
  Location _location = Location();

  /// TODO Method
  /// get current user's current location
  void _onMapCreated(GoogleMapController _googleMapController) {
    controller = _googleMapController;

    /// my current location
    _location.onLocationChanged.listen((event) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          /// CameraPosition is main function of map
          /// Here I tell how much position of my camera
          /// "event" is my current location where I live
          CameraPosition(
            target: LatLng(event.latitude, event.longitude),
            zoom: 15,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    checkOutProvider = Provider.of<CheckOutProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              /// TODO Google Map
              GoogleMap(
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                initialCameraPosition:
                    CameraPosition(target: _initialCameraPosition),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin:
                      EdgeInsets.only(right: 60, left: 10, bottom: 40, top: 40),
                  child: MaterialButton(
                    color: primaryColor,
                    child: Text("Set Location"),
                    shape: StadiumBorder(),
                    onPressed: () async {
                      await _location.getLocation().then((value) {
                        setState(() {
                          checkOutProvider.setLocation = value;
                        });
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
