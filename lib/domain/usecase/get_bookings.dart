
import 'package:dartz/dartz.dart';
import 'package:test_flutter_dev/common_failure.dart';
import 'package:test_flutter_dev/domain/entities/booking.dart';

abstract class GetBookings {
  Future<Either<CommonFailure, List<Booking>>>call();
}
