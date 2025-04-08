class Ride {
  static int rideCount = 0;
  String id;
  double fare;
  Ride(this.fare) : id = "RIDE${++rideCount}";
}
