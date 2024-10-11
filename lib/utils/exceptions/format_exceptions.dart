class TFormatException implements Exception{
  final String message;

  const TFormatException([this.message = "An unexpected format error has occurred. Please check the input"]);



  factory TFormatException.fromMessage(String message){
    return TFormatException(message);
  }

  String get formattedMessage => message;

  factory TFormatException.fromCode(String code){
    switch(code){
      case "invalid-email-format":
        return const TFormatException("This email format is invalid. Please enter valid email.");
      case "invalid-phone-number-format":
        return const TFormatException("The provided phone number is format is invalid. Please enter a valid phone number.");
      case "invalid-date-format":
        return const TFormatException("Thr date format is invalid. Please enter a valid date.");
      case "invalid-url-format":
        return const TFormatException("Thr URL format is invalid. Please enter a valid URL.");
      case "invalid-credit-card-format":
        return const TFormatException("Thr credit card format is invalid. Please enter a valid credit card number number.");
      case "invalid-numeric-format":
        return const TFormatException("Thr input should be a valid numeric format.");
      default:
        return const TFormatException();
    }
  }
}