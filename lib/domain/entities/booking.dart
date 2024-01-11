
import 'package:test_flutter_dev/domain/entities/tennis_court.dart';

class Booking {
  final TennisCourt tennisCourt;
  final DateTime date;
  final String userName;
  

  Booking(this.tennisCourt, this.date, this.userName);

  // Convierte un objeto Booking a un mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'tennisCourt': tennisCourt.toJson(),
      'date': date.toIso8601String(),
      'userName': userName,
    };
  }

  // Crea un objeto Booking desde un mapa (JSON)
  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      TennisCourt.fromJson(json['tennisCourt']),
      DateTime.parse(json['date']),
      json['userName'],
    );
  }
}
