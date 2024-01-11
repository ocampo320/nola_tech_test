import 'package:test_flutter_dev/data/data_source/remote_data_source.dart';
import 'package:test_flutter_dev/domain/repositories/add_booking_imp.dart';
import 'package:test_flutter_dev/domain/repositories/delete_booking_imp.dart';
import 'package:test_flutter_dev/domain/repositories/repository.dart';
import 'package:test_flutter_dev/domain/repositories/repository_impl.dart';
import 'package:test_flutter_dev/domain/usecase/add_booking.dart';
import 'package:test_flutter_dev/domain/usecase/delete_booking.dart';
import 'package:test_flutter_dev/domain/usecase/get_bookings.dart';
import 'package:test_flutter_dev/presentation/bloc/booking_bloc.dart';

import '../domain/repositories/get_bookin_imp.dart';

class AppModule {
  static final AppModule _instance = AppModule._internal();

  factory AppModule() {
    return _instance;
  }

  AppModule._internal();

  GetBookings provideGetBookings(Repository repository) {
    return GetBookingsImpl(repository);
  }

  AddBooking provideAddBooking(Repository repository) {
    return AddBookingImpl(repository);
  }

  DeleteBooking provideDeleteBooking(Repository repository) {
    return DeleteBookingImpl(repository);
  }

  Repository provideRepository(RemoteDataSource remoteDataSource) {
    return RepositoryImpl(remoteDataSource);
  }

  RemoteDataSource provideRemoteDataSource() {
    return RemoteDataSource();
  }

  BookingBloc provideBookingBloc() {
    final repository = provideRepository(provideRemoteDataSource());
    return BookingBloc(
      getBookings: provideGetBookings(repository),
      addBooking: provideAddBooking(repository),
      deleteBooking: provideDeleteBooking(repository),
    );
  }
}
