class InfraException {
  final ExceptionCode code;
  final dynamic error;
  final String? message;

  InfraException(this.code, this.error, {this.message});
}

enum ExceptionCode {
  unexpected;
}