import 'package:nola_tech_test/domain/entities/booking.dart';

abstract class DeleteBooking {
  Future<void> call(Booking booking);
}
