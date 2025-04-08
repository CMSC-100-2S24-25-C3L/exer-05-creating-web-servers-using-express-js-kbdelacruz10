import 'ride.dart';

class Driver {
  static int driverCount = 0;
  String? id;
  List completedRides = [];
  Driver() : id = "DRIVER${++driverCount}";

  acceptRide(Ride ride) {
    print("${id} accepted ${ride.id}");
    completedRides.add(ride.id);
  }
}