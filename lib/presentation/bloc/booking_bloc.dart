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
  BookingBloc({
    required this.getBookings,
    required this.addBooking,
    required this.deleteBooking,
  }) {
    _stateController.add(BookingState.initial());
    _selectedDate = DateTime.now();
    _dateController = BehaviorSubject<DateTime>.seeded(_selectedDate);
    _selectedItemController.add("Cancha A");
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

  void saveBooking() async {
    int cout = 1;
    await loadBookings();
    if (_bookingsController.value.isNotEmpty) {
      for (Booking booking in _bookingsController.value) {
        if (booking.tennisCourt.name == _selectedItemController.value) {
          int currenCount = booking.tennisCourt.bookingCounter??0;
          cout = currenCount + cout;
        }
      }
    }

    final newBooking = Booking(
        TennisCourt(
            name: _selectedItemController.value,
            bookingCounter: cout), // Ajusta según tus necesidades
        _dateController.value,
        _userNameController.value);

    addBookingg(newBooking);
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
