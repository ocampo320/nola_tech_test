import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_flutter_dev/domain/entities/booking.dart';
import 'package:test_flutter_dev/domain/usecase/add_booking.dart';
import 'package:test_flutter_dev/domain/usecase/delete_booking.dart';
import 'package:test_flutter_dev/domain/usecase/get_bookings.dart';

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
      final result = await getBookings();

      result.fold(
        (failure) {
          _stateController.add(BookingState.error("Error al cargar los agendamientos"));
        },
        (bookings) {
          _bookingsController.add(bookings);
          _stateController.add(BookingState.success(bookings));
        },
      );
    } catch (e) {
      _stateController.add(BookingState.error("Error al cargar los agendamientos"));
    }
  }

  void addBookingg(Booking booking) async {
    try {
      final result = await addBooking(booking);

      result.fold(
        (failure) {
          _stateController.add(BookingState.error("Error al agregar el agendamiento"));
        },
        (_) {
          loadBookings();
        },
      );
    } catch (e) {
      _stateController.add(BookingState.error("Error al agregar el agendamiento"));
    }
  }

  void deleteBookingg(Booking booking) async {
    try {
      final result = await deleteBooking(booking);

      result.fold(
        (failure) {
          _stateController.add(BookingState.error("Error al eliminar el agendamiento"));
        },
        (_) {
          loadBookings();
        },
      );
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