part of 'delete_alert_bloc.dart';

@immutable
abstract class DeleteAlertEvent {}

class ExpandedState extends DeleteAlertEvent {}

class ShrinkState extends DeleteAlertEvent {}

class ExpandedInfoState extends DeleteAlertEvent {}
