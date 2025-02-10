import 'package:geolocator/geolocator.dart';

class LocationService{


  Future<Map<String, double>> getCurrentLocation()async{

    try{  Position position= await Geolocator.getCurrentPosition();
    return{
      'latitude':position.latitude,
      'longitude':position.longitude,
    };}
    catch(e){
      print('Error fetching location: $e');
      throw e;
    }

}
}