import 'dart:async';
import 'package:rxdart/rxdart.dart';

class LoadingBloc {
  final _loadingController = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get loadingStream => _loadingController.stream;

  void setLoading(bool isLoading) {
    _loadingController.add(isLoading);
  }

  void dispose() {
    _loadingController.close();
  }
}
