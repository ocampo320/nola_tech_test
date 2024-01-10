import 'package:nola_tech_test/domain/entities/booking.dart';

abstract class AddBooking {
  Future<void> call(Booking booking);
}
