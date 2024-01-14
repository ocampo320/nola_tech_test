import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_dev/app_string.dart';
import 'package:test_flutter_dev/di/app_module.dart';
import 'package:test_flutter_dev/presentation/bloc/booking_bloc.dart';
import 'package:test_flutter_dev/presentation/widgets/custom_alert.dart';
import 'package:test_flutter_dev/presentation/widgets/custom_app_bar_widget.dart';
import 'package:test_flutter_dev/presentation/widgets/custom_buttom.dart';
import 'package:test_flutter_dev/presentation/widgets/custom_date_piker.dart';
import 'package:test_flutter_dev/presentation/widgets/custom_drop_down_widget.dart';
import 'package:test_flutter_dev/presentation/widgets/custom_text_field_widget.dart';

import '../../domain/entities/tennis_court.dart';

class NewBookingPage extends StatefulWidget {
  const NewBookingPage({
    super.key,
  });

  @override
  State<NewBookingPage> createState() => _NewBookingPageState();
}

TextEditingController userName = TextEditingController();

class _NewBookingPageState extends State<NewBookingPage> {
  final BookingBloc _bookingBloc = AppModule().provideBookingBloc();


  @override
  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'Cancha A',
      'Cancha B',
      'Cancha C',
    ];
 

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBarWidget(
          title: AppStrings.booking,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            children: [
              CustomTextFieldWidget(
                hintText: AppStrings.userName,
                labelText: AppStrings.userName,
                onChanged: (v) {
                  _bookingBloc.updateUserName(v);
                  _bookingBloc.validateBookingFields();
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
                        _bookingBloc.validateBookingFields();
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
                        _bookingBloc.validateBookingFields();
                      },
                    );
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: StreamBuilder<bool>(
                  initialData: false,
                  stream: _bookingBloc.showAlertStream,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      child: StreamBuilder<bool>(
                          stream: _bookingBloc.isActiveBtnStream,
                          builder: (context, snapshotIsActive) {
                            return CustomButton(
                              text: AppStrings.save,
                              onPressed: snapshotIsActive.data == true
                                  ? () async {
                                      _bookingBloc.saveBooking().then((value)async {
                                        if (value == true) {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return CustomAlert(
                                                title: AppStrings.alert,
                                                content:
                                                    AppStrings.noMoreMessages,
                                                buttonText: AppStrings.accept,
                                              );
                                            },
                                          );
                                        } else {
                                          _bookingBloc.loadBookings();
                                          context.router.pop();
                                        }
                                      });
                                    }
                                  : () {},
                            );
                          }),
                    );
                  },
                ),
              ),
              /*  FutureBuilder<List<TennisCourt>>(
                future: _bookingBloc.getAvailableCourts(),
                builder: (context, snapshot) {
                  return snapshot.data != null
                      ? ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return buildCourtCard(snapshot.data![index]);
                          },
                        )
                      : const Center(child: CircularProgressIndicator());
                },) */
            ],
          ),
        )),
      ),
    );
  }

  Widget buildCourtCard(TennisCourt court) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            title: Text("Cancha: ${court.name}"),
            subtitle:
                Text("Reservas disponibles: ${3 - court.bookingCounter!}"),
          ),
        ],
      ),
    );
  }
}
