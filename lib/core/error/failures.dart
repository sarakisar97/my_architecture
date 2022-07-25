import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  String get message;
}

class OfflineFailure extends Failure{
  @override
  String get message => 'No internet';

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure{
  final String _message;
  ServerFailure(this._message);

  @override
  String get message => _message;

  @override
  List<Object?> get props => [_message];
}