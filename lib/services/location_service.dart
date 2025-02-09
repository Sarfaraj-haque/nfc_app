import 'package:geolocator/geolocator.dart';

class LocationService{

  Future<Map<String, double>> getCurrentLocation()async{
    Position position= await Geolocator.getCurrentPosition();
    return{
      'latitude':position.latitude,
      'longitude':position.longitude,
    };
}
}