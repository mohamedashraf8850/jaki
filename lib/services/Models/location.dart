import 'package:location/location.dart';

Future<List<double>> getLocation()async{
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  double lat , long;
  try{
      _serviceEnabled = await location.serviceEnabled();
if (!_serviceEnabled) {
  _serviceEnabled = await location.requestService();
  if (!_serviceEnabled) {
  }
}
_permissionGranted = await location.hasPermission();
if (_permissionGranted == PermissionStatus.DENIED) {
  _permissionGranted = await location.requestPermission();
  if (_permissionGranted != PermissionStatus.GRANTED) {
  }
}

_locationData = await location.getLocation();
lat = _locationData.latitude;
long = _locationData.longitude;

    print("lat $lat , long $long");
    return [lat,long];
    }
    catch(e){
      print(e);
    }
    
}
