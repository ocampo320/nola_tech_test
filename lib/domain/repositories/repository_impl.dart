import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:nola_tech_test/common_failure.dart';
import 'package:nola_tech_test/data/data_source/local_data_base.dart';
import 'package:nola_tech_test/data/data_source/remote_data_source.dart';
import 'package:nola_tech_test/domain/entities/booking.dart';
import 'package:nola_tech_test/domain/repositories/repository.dart';
import 'package:sembast/sembast.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;
  RepositoryImpl(this.remoteDataSource);

  static const String _STORE_NAME = "book_data";

  final _store = intMapStoreFactory.store(_STORE_NAME);

  Future<Database> get _db async => await LocalDatabase.instance.database;

  @override
  Future<Either<CommonFailure, bool>> addBooking(Booking booking) async {
    try {
      await _store.add(await _db, booking.toJson());
      debugPrint("--------Guardado en la BD local---------- ${booking.toJson()}");
      return right(true);
    } catch (e) {
      return left(CommonFailure.data(message: e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, List<Booking>>> getBookings() async {
    try {
      final snapshot = await _store.find(await _db);
      debugPrint("--------Consulta en la BD local----------" + snapshot.toString());
      return right(snapshot.map((e) => Booking.fromJson(e.value)).toList());
    } catch (e) {
      return left(CommonFailure.data(message: e.toString()));
    }
  }

  @override
  Future<Either<CommonFailure, bool>> deleteBooking(Booking booking) async {
    try {
      debugPrint("DELETING $booking");
      final finder = Finder(filter: Filter.equals('user', booking.userName));
      await _store.delete(await _db, finder: finder);
      await getBookings();
      return right(true);
    } catch (e) {
      return left(CommonFailure.data(message: e.toString()));
    }
  }
}
