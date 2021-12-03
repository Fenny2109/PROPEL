import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

Placemark finalAddress = Placemark();

String address = finalAddress.name! + ", " + finalAddress.street!
    + ", " + finalAddress.subLocality! + ", " + finalAddress.subAdministrativeArea!
    + ", " + finalAddress.administrativeArea!;


double latitude = 20.7691082;
double longitude = 72.9751604;
double diff = 0.0;

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    permission = await Geolocator.requestPermission();
    //return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location permissions are permanently denied, we cannot request permissions.');
  }
  return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
}

void getLocation() async {
  try{
    Position position = await _determinePosition();
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude,position.longitude);
    finalAddress = placemarks[0];
    print(finalAddress);
    latitude = position.latitude;
    longitude = position.longitude;
  }catch(e){
    print("exception");
    print(e);
  }
}

