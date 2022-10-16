import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'delete_alert_event.dart';
part 'delete_alert_state.dart';

class DeleteAlertBloc extends Bloc<DeleteAlertEvent, DeleteAlertState> {
  DeleteAlertBloc() : super(DeleteAlertInitial()) {
    on<ExpandedState>((event, emit) {
      log("Expandedbloc called");
      emit(DeleteAlertState(isSwitched: false));
    });
    on<ShrinkState>((event, emit) {
      log("Shrinkbloc called");

      emit(DeleteAlertState(isSwitched: true));
    });
  }
}
