import 'package:auto_route/auto_route.dart';
import 'package:test_flutter_dev/presentation/views/home_view.dart';
import 'package:test_flutter_dev/presentation/views/new_booking_view.dart';


@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: NewBookingPage),
  ],
)
class $AppRouter {}
