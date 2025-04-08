import 'driver.dart';
import 'ride.dart';
import 'rider.dart';

void main() {
  List<Rider> riders = [Rider(250), Rider(100), VIPRider(300), VIPRider(200)];

  List<Driver> drivers = [Driver(), Driver(), Driver()];

  List<Ride> rides = [
    Ride(200),
    Ride(150),
    Ride(200),
    Ride(120),
    Ride(180),
    Ride(250),
    Ride(130)
  ];

  riders[0].bookRide(rides[0]);
  riders[1].bookRide(rides[1]);
  riders[2].bookRide(rides[2]);
  drivers[2].acceptRide(rides[3]);
  riders[3].bookRide(rides[2]);
  drivers[2].acceptRide(rides[0]);

  print("\n|| ALL RIDER TRANSACTIONS ||\n");
  for (var rider in riders) {
    print("${rider.id} Transactions: ${rider.rideHistory.join(', ')}");
  }

  print("\n|| ALL DRIVER COMPLETED RIDES ||\n");
  for (var driver in drivers) {
    print("${driver.id} Completed Rides: ${driver.completedRides.join(', ')}");
  }
}

// EXPECTED OUTPUT:

// ✅ RIDER1 booked RIDE1 for ₱200.0
// ❌ RIDER2 does not have enough money for RIDE2
// ✅ VIP1 booked RIDE3 for ₱170.0 (discount applied)
// RIDE4 has not been booked
// RIDE3 is already booked by another rider
// DRIVER3 accepted RIDE1

// || ALL RIDER TRANSACTIONS ||

// RIDER1 Transactions: RIDE1
// RIDER2 Transactions: 
// VIP1 Transactions: RIDE3
// VIP2 Transactions: 

// || ALL DRIVER COMPLETED RIDES ||

// DRIVER1 Completed Rides: 
// DRIVER2 Completed Rides: 
// DRIVER3 Completed Rides: RIDE1
