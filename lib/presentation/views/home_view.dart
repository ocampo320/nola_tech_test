import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_dev/auto_route.gr.dart';
import 'package:test_flutter_dev/presentation/widgets/custom_app_bar_widget.dart';
import 'package:test_flutter_dev/presentation/widgets/custom_buttom.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBarWidget(
          title: 'Agendar',
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            CustomButton(
              onPressed: () {
                context.router.push(const NewBookingPageRoute());
              },
              text: 'Agendar',
            )
          ],
        )),
      ),
    );
  }
}
