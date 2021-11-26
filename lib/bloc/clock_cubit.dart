
import 'package:bloc/bloc.dart';

class ClockCubit extends Cubit<DateTime> {
  final _seconds = Stream.periodic(
    const Duration(seconds: 1),
  ).asBroadcastStream();

  ClockCubit() : super(DateTime.now()) {
    _seconds.listen((event) {
      emit(DateTime.now());
    });
  }
}
