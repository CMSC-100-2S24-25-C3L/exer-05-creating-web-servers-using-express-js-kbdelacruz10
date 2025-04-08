import 'ride.dart';

class Rider {
  static int riderCount = 0;
  String? id;
  double _wallet;
  List rideHistory = [];
  Rider(this._wallet) : id = "RIDER${++riderCount}";

  bool bookRide(Ride ride) {
    if (ride.fare <= _wallet) {
      this._wallet = this._wallet - ride.fare;
      print("${id} booked ${ride.id} for ₱${ride.fare}");
      rideHistory.add(ride.id);
      return true;
    } else {
      print("${id} does not have enough money for ${ride.id}");
      return false;
    }
  }
}

class VIPRider extends Rider {
  VIPRider(int _wallet) : super(_wallet.toDouble());
  @override
  bool bookRide(Ride ride) {
    if (ride.fare * .85 <= _wallet) {
      this._wallet = this._wallet - (ride.fare * .85);
      print("${id} booked ${ride.id} for ₱${ride.fare} (discount applied)");
      rideHistory.add(ride.id);
      return true;
    } else {
      print("${id} does not have enough money for ${ride.id}");
      return false;
    }
  }
}