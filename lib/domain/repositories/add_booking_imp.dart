import 'package:dartz/dartz.dart';
import 'package:test_flutter_dev/common_failure.dart';
import 'package:test_flutter_dev/domain/entities/booking.dart';
import 'package:test_flutter_dev/domain/repositories/repository.dart';
import 'package:test_flutter_dev/domain/usecase/add_booking.dart';

class AddBookingImpl implements AddBooking {
  final Repository repository;

  AddBookingImpl(this.repository);

  @override
  Future<Either<CommonFailure, bool>> call(Booking booking) {
    return repository.addBooking(booking);
  }
}