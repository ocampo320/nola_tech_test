import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_flutter_dev/domain/entities/booking.dart';
import 'package:test_flutter_dev/domain/entities/tennis_court.dart';
import 'package:test_flutter_dev/domain/usecase/add_booking.dart';
import 'package:test_flutter_dev/domain/usecase/delete_booking.dart';
import 'package:test_flutter_dev/domain/usecase/get_bookings.dart';
import 'package:test_flutter_dev/presentation/bloc/booking_bloc.dart';

class MockGetBookings extends Mock implements GetBookings {}

class MockAddBooking extends Mock implements AddBooking {}

class MockDeleteBooking extends Mock implements DeleteBooking {}

void main() {
  late BookingBloc bookingBloc;
  late MockGetBookings mockGetBookings;
  late MockAddBooking mockAddBooking;
  late MockDeleteBooking mockDeleteBooking;

  setUp(() {
    mockGetBookings = MockGetBookings();
    mockAddBooking = MockAddBooking();
    mockDeleteBooking = MockDeleteBooking();

    bookingBloc = BookingBloc(
      getBookings: mockGetBookings,
      addBooking: mockAddBooking,
      deleteBooking: mockDeleteBooking,
    );
  });

  test('Initial state is correct', () {
    expect(bookingBloc.stateStream, emits(BookingState.initial()));
  });

  test('Load bookings success', () async {
    final mockBookings = [
      Booking(
        TennisCourt(name: 'Cancha A', bookingCounter: 0),
        DateTime.now(),
        'Usuario 1',
      ),
      // Agrega más reservas según tus necesidades
    ];

    when(mockGetBookings()).thenAnswer((_) async => Right(mockBookings));

    await bookingBloc.loadBookings();

    verify(mockGetBookings()).called(1);
    expect(
      bookingBloc.stateStream,
      emits(BookingState.success(mockBookings)),
    );
    expect(bookingBloc.bookingsStream, emits(mockBookings));
  });

  // Agrega más pruebas según sea necesario para cubrir otras funcionalidades del bloc
}
