import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_dev/app_string.dart';
import 'package:test_flutter_dev/auto_route.gr.dart';
import 'package:test_flutter_dev/data/data_source/remote_data_source.dart';
import 'package:test_flutter_dev/di/app_module.dart';
import 'package:test_flutter_dev/domain/entities/booking.dart';
import 'package:test_flutter_dev/presentation/bloc/booking_bloc.dart';
import 'package:test_flutter_dev/presentation/widgets/custom_alert.dart';
import 'package:test_flutter_dev/presentation/widgets/custom_app_bar_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final BookingBloc _bookingBloc = AppModule().provideBookingBloc();
  @override
  void initState() {
    super.initState();
    _bookingBloc.loadBookings();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              context.router.push(const NewBookingPageRoute());
            },
          ),
          appBar: const CustomAppBarWidget(
            title: AppStrings.booking,
          ),
          body: StreamBuilder(
            stream: _bookingBloc.bookingsStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Booking> bookings = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: bookings.length,
                  itemBuilder: (context, index) {
                    return buildBookingCard(
                        bookings[index], _bookingBloc, context);
                  },
                );
              } else if (snapshot.hasError) {
                return const Text(AppStrings.error);
              }

              return const Center(
                  child:
                      CircularProgressIndicator()); // Puedes mostrar un indicador de carga mientras se cargan los datos
            },
          )),
    );
  }
}

Widget buildBookingCard(
    Booking booking, BookingBloc bookingBloc, BuildContext context) {
  bookingBloc.loadBookings();
  return Card(
    elevation: 4.0,
    margin: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        ListTile(
          leading: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.wb_cloudy_sharp,
                  size: 25,
                ),
              ),
              FutureBuilder<String>(
                  future: RemoteDataSource.getWeatherMapServicesByDate(
                      booking.date),
                  builder: (context, snapshot) {
                    return snapshot.data != null
                        ? Text(snapshot.data.toString())
                        : const SizedBox.shrink();
                  }),
            ],
          ),
          title: Text("${AppStrings.name}: ${booking.userName}"),
          subtitle: Text("${AppStrings.date}: ${booking.tennisCourt.name}"),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("${AppStrings.date}: ${booking.date.toString()}"),
        ),
        ButtonBar(
          children: [
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomAlert(
                      function: () {
                        context.router.pop();
                        bookingBloc.deleteBookingg(booking);
                      },
                      title: AppStrings.alert,
                      content: AppStrings.deleteMesagges,
                      buttonText: AppStrings.accept,
                    );
                  },
                );
              },
              child: const Icon(Icons.delete_forever),
            ),
          ],
        ),
      ],
    ),
  );
}
