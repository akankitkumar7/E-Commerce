class TPlatformException implements Exception {
  final String code;


  TPlatformException(this.code);

  String get message{
    switch(code){
      case "INVALID_LOGIN_CREDENTIALS":
        return "Invalid login details";
    } return " ";
  }
}