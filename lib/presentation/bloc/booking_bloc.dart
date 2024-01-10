import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:nola_tech_test/domain/usecase/add_booking.dart';
import 'package:nola_tech_test/domain/usecase/delete_booking.dart';
import 'package:nola_tech_test/domain/usecase/get_bookings.dart';
import '../../domain/entities/booking.dart';

import 'package:rxdart/rxdart.dart';

class BookingBloc {
  final GetBookings getBookings;
  final AddBooking addBooking;
  final DeleteBooking deleteBooking;

  final _bookingsController = BehaviorSubject<List<Booking>>();
  final _stateController = BehaviorSubject<BookingState>();

  Stream<List<Booking>> get bookingsStream => _bookingsController.stream;
  Stream<BookingState> get stateStream => _stateController.stream;

  BookingBloc({
    required this.getBookings,
    required this.addBooking,
    required this.deleteBooking,
  }) {
    _stateController.add(BookingState.initial());
  }

  void loadBookings() async {
    try {
      final bookings = await getBookings();
      _bookingsController.add(bookings);
      _stateController.add(BookingState.success(bookings));
    } catch (e) {
      _stateController.add(BookingState.error("Error al cargar los agendamientos"));
    }
  }

  void addBookingg(Booking booking) async {
    try {
      await addBooking(booking);
      loadBookings();
    } catch (e) {
      _stateController.add(BookingState.error("Error al agregar el agendamiento"));
    }
  }

  void deleteBookingg(Booking booking) async {
    try {
      await deleteBooking(booking);
      loadBookings();
    } catch (e) {
      _stateController.add(BookingState.error("Error al eliminar el agendamiento"));
    }
  }

  void dispose() {
    _bookingsController.close();
    _stateController.close();
  }
}

class BookingState extends Equatable {
  final List<Booking>? bookings;
  final String? error;

  const BookingState({this.bookings, this.error});

  factory BookingState.initial() {
    return const BookingState(bookings: null, error: null);
  }

  factory BookingState.success(List<Booking> bookings) {
    return BookingState(bookings: bookings, error: null);
  }

  factory BookingState.error(String error) {
    return BookingState(bookings: null, error: error);
  }

  @override
  List<Object?> get props => [bookings, error];
}
