String? phoneField(String? fieldContent) { //<-- add String? as a return type
  if(fieldContent!.isEmpty) {
    return 'Invalid Phone Number';
  }
  return null;
}
String? fullNameField(String? fieldContent) { //<-- add String? as a return type
  if(fieldContent!.isEmpty) {
    return 'Invalid Name';
  }
  return null;
}
String? verifyCodeField(String? fieldContent) { //<-- add String? as a return type
  if(fieldContent!.isEmpty) {
    return 'Invalid Code';
  }
  return null;
}