import 'package:flutter/material.dart';
import 'package:test_flutter_dev/di/app_module.dart';
import 'package:test_flutter_dev/domain/entities/booking.dart';
import 'package:test_flutter_dev/domain/entities/tennis_court.dart';
import 'package:test_flutter_dev/presentation/bloc/booking_bloc.dart';
import 'package:test_flutter_dev/presentation/widgets/custom_app_bar_widget.dart';
import 'package:test_flutter_dev/presentation/widgets/custom_buttom.dart';
import 'package:test_flutter_dev/presentation/widgets/custom_date_piker.dart';
import 'package:test_flutter_dev/presentation/widgets/custom_drop_down_widget.dart';
import 'package:test_flutter_dev/presentation/widgets/custom_text_field_widget.dart';

class NewBookingPage extends StatefulWidget {
  const NewBookingPage({
    super.key,
  });

  @override
  State<NewBookingPage> createState() => _NewBookingPageState();
}

TextEditingController userName = TextEditingController();

class _NewBookingPageState extends State<NewBookingPage> {
  @override
  Widget build(BuildContext context) {
    final BookingBloc _bookingBloc = AppModule().provideBookingBloc();

    List<String> items = [
      'Cancha A',
      'Cancha B',
      'Cancha C',
    ];

    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBarWidget(
        title: 'Agendar',
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          children: [
            CustomTextFieldWidget(
              hintText: 'Nombre de usuario',
              labelText: 'Nombre de usuario',
              onChanged: (v) {
                _bookingBloc.updateUserName(v);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<DateTime>(
                stream: _bookingBloc.dateStream,
                builder: (context, snapshot) {
                  return CustomDatePicker(
                    selectedDate: snapshot.data ?? DateTime.now(),
                    onDateChanged: (newDate) {
                      _bookingBloc.selectedDate = newDate;
                    },
                  );
                }),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<String>(
                stream: _bookingBloc.selectedItemStream,
                builder: (context, snapshot) {
                  return CustomDropdown(
                    items: items,
                    selectedItem: snapshot.data ?? "",
                    onItemSelected: (value) {
                      _bookingBloc.setSelectedItem(value ?? "");
                    },
                  );
                }),
            CustomButton(
              text: "Guardar",
              onPressed: () => _bookingBloc.saveBooking(),
            )
          ],
        ),
      )),
    ));
  }
}
