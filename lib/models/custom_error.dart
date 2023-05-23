import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final String errorType;
  final String errorMessage;

  const CustomError({this.errorType = '', this.errorMessage = ''});

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [errorType, errorMessage];

  CustomError copyWith({
    String? errorType,
    String? errorMessage,
  }) {
    return CustomError(
      errorType: errorType ?? this.errorType,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
