class TPlatformException implements Exception {
  final String code;

  TPlatformException(this.code);

  String get message {
    switch (code) {
      case "INVALID_LOGIN_CREDENTIALS":
        return "Invalid login credentials. Please double check your details.";
      case "too-many-request":
        return "Too many request. Please try again later.";
      case "invalid-argument":
        return "Invalid argument provided to the authentication method.";
      case "invalid-password":
        return "Incorrect password. Please try again";
      case "invalid-phone-number":
        return "The phone number is invalid.";
      case "operation-not-allowed":
        return "The sign-in provider is disabled for your firebase project.";
      case "session-cookie-expired":
        return "The firebase session cookie has expired. Please sign in again.";
      case "uid-already-exists":
        return "The provided user ID is already in use by some another user.";
      case "sign-in-failed":
        return "Sign in failed. Please try again.";
      case "network-request-error":
        return "Network request failed. Please try again.";
      case "internal-error":
        return "Internal error occurred. Please try again";
      case "invalid-verification-code":
        return "Invalid verification code. Please enter a valid code.";
      case "invalid-verification-id":
        return "Invalid verification ID. Please enter a valid verification ID";
      case "quota-exceeded":
        return "Quota exceeded, Please try again later.";
      default:
        return "An unexpected error occurred. Please try again";
    }
  }
}
