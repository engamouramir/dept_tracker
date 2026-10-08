 class Failure {
  final String message;
  Failure({required this.message});
}

class NetworkFailure extends Failure { 
NetworkFailure({required super.message});
}

class ArgumentError extends Failure {
  ArgumentError({required super.message});
}