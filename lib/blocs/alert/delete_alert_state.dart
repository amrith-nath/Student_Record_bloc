part of 'delete_alert_bloc.dart';

class DeleteAlertState {
  final bool isSwitched;

  DeleteAlertState({required this.isSwitched});
}

class DeleteAlertInitial extends DeleteAlertState {
  DeleteAlertInitial() : super(isSwitched: true);
}
