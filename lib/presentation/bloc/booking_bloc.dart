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
  final _isActiveBtnController = BehaviorSubject<bool>();
  final _stateController = BehaviorSubject<BookingState>();
  final _bookingsAviableController = BehaviorSubject<List<Booking>>();
  late BehaviorSubject<DateTime> _dateController;
  late DateTime _selectedDate;

  Stream<List<Booking>> get bookingsAviableStream =>
      _bookingsAviableController.stream;

  Stream<List<Booking>> get bookingsStream => _bookingsController.stream;
  Stream<BookingState> get stateStream => _stateController.stream;
  final BehaviorSubject<String> _selectedItemController =
      BehaviorSubject<String>();
  Stream<String> get selectedItemStream => _selectedItemController.stream;
  final BehaviorSubject<String> _userNameController = BehaviorSubject<String>();
  Stream<String> get userNameStream => _userNameController.stream;

  final BehaviorSubject<bool> _showAlertController = BehaviorSubject<bool>();
  Stream<bool> get showAlertStream => _showAlertController.stream;
  Stream<bool> get isActiveBtnStream => _isActiveBtnController.stream;
  BookingBloc({
    required this.getBookings,
    required this.addBooking,
    required this.deleteBooking,
  }) {
    _stateController.add(BookingState.initial());
    _selectedDate = DateTime.now();
    _dateController = BehaviorSubject<DateTime>.seeded(_selectedDate);
    _selectedItemController.add("Cancha A");
    _showAlertController.add(false);
    _isActiveBtnController.add(false);
    _isActiveBtnController.add(false);
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

  Future<bool> saveBooking() async {
    bool response = false;
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
      _showAlertController.add(true);
      response = true;
    } else {
      // Puedes hacer la reserva porque no hay más de 3 reservas para esta cancha en este día
      final newBooking = Booking(
          TennisCourt(
              name: _selectedItemController.value,
              bookingCounter: 0), // Ajusta según tus necesidades
          _dateController.value,
          _userNameController.value);

      addBookingg(newBooking);
      _showAlertController.add(false);
      response = false;
    }

    return response;
  }

  Future<List<TennisCourt>> getAvailableCourts() async {
    try {
      // Obtener todas las reservas
      final result = await getBookings();

      result.fold(
        (failure) {
          _stateController
              .add(BookingState.error("Error al cargar los agendamientos"));
        },
        (bookings) {
          // Filtrar las reservas para las canchas A, B y C
          final List<Booking> filteredBookings = bookings
              .where((booking) =>
                  booking.tennisCourt.name == "Cancha A" ||
                  booking.tennisCourt.name == "Cancha B" ||
                  booking.tennisCourt.name == "Cancha C")
              .toList();

          // Mapa para realizar un seguimiento del contador de reservas por cancha
          final Map<String, int> courtReservationsCount = {};

          // Contar las reservas por cancha
          for (var booking in filteredBookings) {
            final courtName = booking.tennisCourt.name;
            courtReservationsCount[courtName ?? ""] =
                (courtReservationsCount[courtName] ?? 0) + 1;
          }

          // Filtrar las canchas con menos de 3 reservas
          final availableCourts = courtReservationsCount.entries
              .where((entry) => entry.value < 3)
              .map((entry) =>
                  TennisCourt(name: entry.key, bookingCounter: entry.value))
              .toList();

          _stateController.add(BookingState.success(bookings));
          return availableCourts;
        },
      );
    } catch (e) {
      // Manejar la excepción según tu lógica de la aplicación
      // Puedes lanzar la excepción o devolver una lista vacía, dependiendo de tus necesidades
      return [];
    }
    return [];
  }

  bool validateBookingFields() {
    // Validar que el nombre de usuario no esté vacío
    if (_userNameController.value?.isEmpty ?? true) {
      _isActiveBtnController.add(false);
     
    } else {
      _isActiveBtnController.add(true);

    }

    // Validar que la fecha no sea nula
    if (_dateController.value == null) {
       _isActiveBtnController.add(false);
     
    } else {
      _isActiveBtnController.add(true);

    }

    // Validar que el nombre de la cancha no esté vacío
    if (_selectedItemController.value?.isEmpty ?? true) {
       _isActiveBtnController.add(false);
     
    } else {
      _isActiveBtnController.add(true);

    }

    return _isActiveBtnController.value;
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
