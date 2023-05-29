// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Failure extends Equatable implements Exception {
  final String? message;
  Failure({
    this.message,
  });

  @override
  List<dynamic> get props => [message];
}
