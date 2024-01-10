import 'package:nola_tech_test/domain/entities/booking.dart';

abstract class GetBookings {
  Future<List<Booking>> call();
}
