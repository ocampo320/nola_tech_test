import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_flutter_dev/domain/entities/booking.dart';
import 'package:test_flutter_dev/domain/entities/tennis_court.dart';
import 'package:test_flutter_dev/domain/usecase/add_booking.dart';
import 'package:test_flutter_dev/domain/usecase/delete_booking.dart';
import 'package:test_flutter_dev/domain/usecase/get_bookings.dart';

class BookingBloc {
  final GetBookings getBookings;
  final AddBooking addBooking;
  final DeleteBooking deleteBooking;

  final _bookingsController = BehaviorSubject<List<Booking>>();
  final _stateController = BehaviorSubject<BookingState>();

  late BehaviorSubject<DateTime> _dateController;
  late DateTime _selectedDate;

  Stream<List<Booking>> get bookingsStream => _bookingsController.stream;
  Stream<BookingState> get stateStream => _stateController.stream;
  final BehaviorSubject<String> _selectedItemController =
      BehaviorSubject<String>();
  Stream<String> get selectedItemStream => _selectedItemController.stream;
  final BehaviorSubject<String> _userNameController = BehaviorSubject<String>();
  Stream<String> get userNameStream => _userNameController.stream;

  final BehaviorSubject<bool> _showAlertController = BehaviorSubject<bool>();
  Stream<bool> get showAlertStream => _showAlertController.stream;
  BookingBloc({
    required this.getBookings,
    required this.addBooking,
    required this.deleteBooking,
  }) {
    _stateController.add(BookingState.initial());
    _selectedDate = DateTime.now();
    _dateController = BehaviorSubject<DateTime>.seeded(_selectedDate);
    _selectedItemController.add("Cancha A");
    _showAlertController.add(true);
  }

  // Getter para obtener el stream
  Stream<DateTime> get dateStream => _dateController.stream;

  // Getter para obtener la fecha actual
  DateTime get selectedDate => _selectedDate;

  void updateUserName(String userName) {
    _userNameController.sink.add(userName);
  }

  // Setter para cambiar la fecha y agregar al stream
  set selectedDate(DateTime newDate) {
    _selectedDate = newDate;
    _dateController.add(_selectedDate);
  }

  void setSelectedItem(String selectedItem) {
    _selectedItemController.sink.add(selectedItem);
  }

  Future loadBookings() async {
  try {
    final result = await getBookings();

    result.fold(
      (failure) {
        _stateController
            .add(BookingState.error("Error al cargar los agendamientos"));
      },
      (bookings) {
        // Ordenar los agendamientos por fecha (ascendente)
        bookings.sort((a, b) => a.date.compareTo(b.date));

        _bookingsController.add(bookings);
        _stateController.add(BookingState.success(bookings));
      },
    );
  } catch (e) {
    _stateController
        .add(BookingState.error("Error al cargar los agendamientos"));
  }
}


  void addBookingg(Booking booking) async {
    try {
      final result = await addBooking(booking);

      result.fold(
        (failure) {
          _stateController
              .add(BookingState.error("Error al agregar el agendamiento"));
        },
        (_) {
          loadBookings();
        },
      );
    } catch (e) {
      _stateController
          .add(BookingState.error("Error al agregar el agendamiento"));
    }
  }

  void deleteBookingg(Booking booking) async {
    try {
      final result = await deleteBooking(booking);

      result.fold(
        (failure) {
          _stateController
              .add(BookingState.error("Error al eliminar el agendamiento"));
        },
        (_) {
          loadBookings();
        },
      );
    } catch (e) {
      _stateController
          .add(BookingState.error("Error al eliminar el agendamiento"));
    }
  }

  Future saveBooking() async {
    await loadBookings();

    // Filtrar las reservas solo para la cancha seleccionada y la fecha seleccionada
    List<Booking> bookingsForSelectedCourtAndDate = _bookingsController.value
        .where((booking) =>
            booking.tennisCourt.name == _selectedItemController.value &&
            booking.date.year == _selectedDate.year &&
            booking.date.month == _selectedDate.month &&
            booking.date.day == _selectedDate.day)
        .toList();

    if (bookingsForSelectedCourtAndDate.length >= 3) {
      // Ya hay 3 reservas para esta cancha en este día
      _showAlertController.add(false);
    } else {
      // Puedes hacer la reserva porque no hay más de 3 reservas para esta cancha en este día
      final newBooking = Booking(
          TennisCourt(
              name: _selectedItemController.value,
              bookingCounter: 0), // Ajusta según tus necesidades
          _dateController.value,
          _userNameController.value);

      addBookingg(newBooking);
      _showAlertController.add(true);
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
