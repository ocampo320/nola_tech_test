import 'package:nola_tech_test/domain/entities/tennis_court.dart';

class Booking {
  final TennisCourt tennisCourt;
  final DateTime date;
  final String userName;

  Booking(this.tennisCourt, this.date, this.userName);
}
