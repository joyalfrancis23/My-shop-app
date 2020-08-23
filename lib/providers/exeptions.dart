//This is a class that contains the error handling message code.
class HttpExeptions implements Exception{
  final String message;
  HttpExeptions(this.message);

@override
  String toString() {

    return message;
  }
}