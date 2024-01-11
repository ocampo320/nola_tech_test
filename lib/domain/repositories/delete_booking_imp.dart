  import 'package:dartz/dartz.dart';
import 'package:test_flutter_dev/common_failure.dart';
import 'package:test_flutter_dev/domain/entities/booking.dart';
import 'package:test_flutter_dev/domain/repositories/repository.dart';
import 'package:test_flutter_dev/domain/usecase/delete_booking.dart';

class DeleteBookingImpl implements DeleteBooking {
  final Repository repository;

  DeleteBookingImpl(this.repository);

  @override
  Future<Either<CommonFailure, bool>> call(Booking booking) {
    return repository.deleteBooking(booking);
  }
}