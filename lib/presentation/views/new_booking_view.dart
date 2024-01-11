import 'package:flutter/material.dart';
import 'package:test_flutter_dev/presentation/bloc/date_bloc.dart';
import 'package:test_flutter_dev/presentation/widgets/custom_app_bar_widget.dart';
import 'package:test_flutter_dev/presentation/widgets/custom_date_piker.dart';
import 'package:test_flutter_dev/presentation/widgets/custom_text_field_widget.dart';

class NewBookingPage extends StatelessWidget {
  const NewBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DateBloc _dateBloc = DateBloc();
    TextEditingController userName = TextEditingController();

    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBarWidget(
        title: 'Agendar',
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          CustomTextFieldWidget(
            hintText: 'Nombre de usuario',
            controller: userName,
            labelText: 'Nombre de usuario',
          ),
          StreamBuilder<DateTime>(
            stream: _dateBloc.dateStream,
            builder: (context, snapshot) {
              return CustomDatePicker(
                selectedDate: snapshot.data??DateTime.now(),
                onDateChanged: (newDate) {
                  _dateBloc.selectedDate = newDate;
                },
              );
            }
          )
        ],
      )),
    ));
  }
}
