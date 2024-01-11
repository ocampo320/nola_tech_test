
import 'package:dartz/dartz.dart';
import 'package:test_flutter_dev/common_failure.dart';
import 'package:test_flutter_dev/domain/entities/booking.dart';

abstract class AddBooking {
 Future<Either<CommonFailure, bool>> call(Booking booking);
}
