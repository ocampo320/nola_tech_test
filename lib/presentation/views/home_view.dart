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
import 'package:test_flutter_dev/date_util.dart' as DateUtil;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with WidgetsBindingObserver {
  final BookingBloc _bookingBloc = AppModule().provideBookingBloc();
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // La aplicación ha vuelto a estar activa (pantalla principal visible)
      _bookingBloc.loadBookings();
    }
  }

  @override
  void initState() {
    super.initState();
    _bookingBloc.loadBookings();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    _bookingBloc.loadBookings();
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () async {
              // Realizar un push a la nueva pantalla
              final result = await context.router.push(NewBookingPageRoute());

              // Puedes manejar el resultado si lo necesitas
              if (result != null) {
                print('Resultado de la pantalla nueva: $result');
              }

              // Actualizar datos después de regresar
              _bookingBloc.loadBookings();
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
                return Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: ListView.builder(
                    itemCount: bookings.length,
                    itemBuilder: (context, index) {
                      return buildBookingCard(
                          bookings[index], _bookingBloc, context);
                    },
                  ),
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
  Booking booking,
  BookingBloc bookingBloc,
  BuildContext context,
) {
  bookingBloc.loadBookings();
  return  booking.tennisCourt.name!.isNotEmpty?  Card(
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
                        ? Text(snapshot.data ?? "")
                        : const SizedBox.square();
                  })
            ],
          ),
          title:Text("${AppStrings.name}: ${booking.userName}"),
          subtitle:booking.tennisCourt.name != ""? Text("${AppStrings.court}: ${booking.tennisCourt.name}"):const SizedBox.shrink(),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
              "${AppStrings.date}: ${DateUtil.DateUtils.formatDate(booking.date)}"),
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
              child: booking.tennisCourt.name != ""
                  ? const Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ],
    ),
  ):const Padding(
    padding: EdgeInsets.only(top: 16),
    child: Center(child: Text("Lista de Reservas")),
  );
}
