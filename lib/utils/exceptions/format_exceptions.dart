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
    } return const TFormatException(" ");
  }
}