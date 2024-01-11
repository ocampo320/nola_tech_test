


import 'package:dartz/dartz.dart';
import 'package:test_flutter_dev/common_failure.dart';
import 'package:test_flutter_dev/domain/entities/booking.dart';
import 'package:test_flutter_dev/domain/repositories/repository.dart';
import 'package:test_flutter_dev/domain/usecase/get_bookings.dart';

class GetBookingsImpl implements GetBookings {
  final Repository repository;

  GetBookingsImpl(this.repository);

  @override
  Future<Either<CommonFailure, List<Booking>>> call() {
    return repository.getBookings();
  }
}