import 'package:dartz/dartz.dart';
import 'package:test_flutter_dev/common_failure.dart';
import 'package:test_flutter_dev/domain/entities/booking.dart';

abstract class Repository {
  Future<Either<CommonFailure, List<Booking>>> getBookings();
 Future<Either<CommonFailure, bool>> addBooking(Booking booking);
 Future<Either<CommonFailure, bool>> deleteBooking(Booking booking);
}
