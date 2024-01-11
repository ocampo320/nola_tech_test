import 'package:flutter/material.dart';
import 'package:test_flutter_dev/domain/entities/booking.dart';
import 'package:test_flutter_dev/domain/entities/tennis_court.dart';
import 'package:test_flutter_dev/presentation/bloc/booking_bloc.dart';

class BookingView extends StatefulWidget {
  final BookingBloc bookingBloc;

  BookingView({required this.bookingBloc});

  @override
  _BookingViewState createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  final TextEditingController _userNameController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildAddBookingForm(),
            SizedBox(height: 16),
            Expanded(
              child: _buildBookingsList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddBookingForm() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _userNameController,
            decoration: InputDecoration(labelText: 'Nombre del usuario'),
          ),
        ),
        SizedBox(width: 16),
        ElevatedButton(
          onPressed: () {
            _addBooking();
          },
          child: Text('Agregar'),
        ),
      ],
    );
  }

  void _addBooking() {
    final userName = _userNameController.text;
    if (userName.isNotEmpty) {
      final newBooking = Booking(
        TennisCourt(name: 'Cancha A'), // Ajusta según tus necesidades
        DateTime.now(), // Puedes ajustar la fecha según tus necesidades
        userName,
      );

      widget.bookingBloc.addBookingg(newBooking);
    }
  }

  Widget _buildBookingsList() {
    return StreamBuilder<List<Booking>>(
      stream: widget.bookingBloc.bookingsStream,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final bookings = snapshot.data!;
          return ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              final booking = bookings[index];
              return ListTile(
                title: Text(booking.userName),
                subtitle: Text('Cancha: ${booking.tennisCourt.name}, Fecha: ${booking.date}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    widget.bookingBloc.deleteBookingg(booking);
                  },
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('Error al cargar los agendamientos');
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
