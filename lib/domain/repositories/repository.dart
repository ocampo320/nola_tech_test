import 'package:dartz/dartz.dart';
import 'package:nola_tech_test/common_failure.dart';
import 'package:nola_tech_test/domain/entities/booking.dart';

abstract class Repository {
  Future<Either<CommonFailure, List<Booking>>> getBookings();
 Future<Either<CommonFailure, bool>> addBooking(Booking booking);
 Future<Either<CommonFailure, bool>> deleteBooking(Booking booking);
}
