class TFirebaseAuthException implements Exception{

  /// the error code associated with the exception
  final String code;

  /// constructor that takes an error code
  TFirebaseAuthException(this.code);


  /// get the corresponding error message on the error code

  String get message{
    switch(code){
      case 'email-already-in-use':
        return "The email address is already registered. Please use a different email.";
        case 'invalid-email':
        return "The email address provided is invalid. Please enter a valid email.";
        case 'weak-password':
        return "The password is too weak. Please choose a stronger password.";
        case 'user-disabled':
        return "This user account has been disable. Please contact support team for assistance.";
        case 'user-not-found':
        return "Invalid login details. User not found.";
        case 'wrong-password':
        return "Incorrect password. Please check your password and try again.";
        case 'Invalid-verification-code':
        return "Invalid Verification code. Please enter a valid code.";
        case 'Invalid-verification-id':
        return "Invalid Verification ID. Please request a new verification ID.";
        case 'quota-exceeded':
        return "Quota exceeded. Please try again later.";
        case 'email-already-exists':
        return "The email address is already exists. Please use a different email.";
        case 'provider-already-linked':
        return "The account is already linked with another provider.";
        case 'require-recent-login':
        return "This operation is sensitive and require recent authentication. Please log in again.";
        case 'credential-already-in-use':
        return "This credential is already associated with a different user account.";
        case 'user-mismatch':
        return "The supplied credentials do not correspond to the previously signed user.";
    } return " ";
  }


}