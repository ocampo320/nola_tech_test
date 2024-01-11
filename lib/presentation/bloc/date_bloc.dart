import 'package:rxdart/rxdart.dart';

class DateBloc {
  late BehaviorSubject<DateTime> _dateController;
  late DateTime _selectedDate;

  DateBloc() {
    _selectedDate = DateTime.now();
    _dateController = BehaviorSubject<DateTime>.seeded(_selectedDate);
  }

  // Getter para obtener el stream
  Stream<DateTime> get dateStream => _dateController.stream;

  // Getter para obtener la fecha actual
  DateTime get selectedDate => _selectedDate;

  // Setter para cambiar la fecha y agregar al stream
  set selectedDate(DateTime newDate) {
    _selectedDate = newDate;
    _dateController.add(_selectedDate);
  }

  // Cerrar el stream cuando ya no sea necesario
  void dispose() {
    _dateController.close();
  }
}
