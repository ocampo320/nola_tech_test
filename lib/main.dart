import 'package:flutter/material.dart';
import 'package:test_flutter_dev/auto_route.gr.dart';
import 'package:test_flutter_dev/data/data_source/remote_data_source.dart';
import 'package:test_flutter_dev/presentation/bloc/booking_bloc.dart';

import 'domain/repositories/add_booking_imp.dart';
import 'domain/repositories/delete_booking_imp.dart';
import 'domain/repositories/get_bookin_imp.dart';
import 'domain/repositories/repository_impl.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    final remoteDataSource = RemoteDataSource(); // Puedes ajustar según tus necesidades
    final repository = RepositoryImpl(remoteDataSource);
    final getBookings = GetBookingsImpl(repository);
    final addBooking = AddBookingImpl(repository);
    final deleteBooking = DeleteBookingImpl(repository);

    final bookingBloc = BookingBloc(
      getBookings: getBookings,
      addBooking: addBooking,
      deleteBooking: deleteBooking,
    );

    return MaterialApp.router(
      title: 'Booking App',
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
