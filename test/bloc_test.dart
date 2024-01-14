import 'package:dartz/dartz.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_flutter_dev/common_failure.dart';
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

  group('BookingBloc', () {
    test('Initial state is correct', () {
      expect(bookingBloc.stateStream, emits(BookingState.initial()));
    });

    fakeAsync((fakeAsync) {
      test('Load bookings success', () {
        final mockBookings = [
          Booking(
            TennisCourt(name: 'Cancha A', bookingCounter: 0),
            DateTime.now(),
            'Usuario 1',
          ),
          // Agrega más reservas según tus necesidades
        ];

        when(mockGetBookings()).thenAnswer((_) async => Right(mockBookings));

        fakeAsync.run((fakeAsync) {
          bookingBloc.loadBookings();

          // Asegúrate de que se haya llamado al método getBookings
          verify(mockGetBookings()).called(1);

          // Debe emitir el estado correcto después de cargar las reservas
          expect(
            bookingBloc.stateStream,
            emits(BookingState.success(mockBookings)),
          );

          // Debe emitir las reservas correctamente después de cargarlas
          expect(bookingBloc.bookingsStream, emits(mockBookings));
        });
      });
    });

    test('Load bookings failure', () {
    //  when(mockGetBookings()).thenAnswer((_) async =>   Left(CommonFailure("Error")));

      bookingBloc.loadBookings();

      // Asegúrate de que se haya llamado al método getBookings
      verify(mockGetBookings()).called(1);

      // Debe emitir un estado de error después de un fallo al cargar las reservas
      expect(
        bookingBloc.stateStream,
        emits(BookingState.error("Error al cargar los agendamientos")),
      );

      // Debe emitir una lista vacía después de un fallo al cargar las reservas
      expect(bookingBloc.bookingsStream, emits([]));
    });

    // Agrega más pruebas según sea necesario para cubrir otras funcionalidades del bloc
  });
}
