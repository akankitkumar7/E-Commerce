class TFirebaseException implements Exception{
  /// the error code associated with the exception
  final String code;

  /// constructor that takes an error code
  TFirebaseException(this.code);


  /// get the corresponding error message based on the error code

  String get message{
    switch(code){
      case 'unknown':
        return "An unknown error has occurred. Please try again.";
      default:
        return"An unexpected error occurred. Please try again";
    }
  }
}